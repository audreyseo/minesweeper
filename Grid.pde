class Grid {
  ArrayList<ArrayList<Tile>> g;
  int w, h;

  Grid(int w, int h) {
    this.w = w;
    this.h = h;
    // this is stored as a list of columns
    this.g = new ArrayList<ArrayList<Tile>>(w);
    for (int i = 0; i < w; i++) {
      this.g.add(new ArrayList<Tile>(h));
      for (int j = 0; j < h; j++) {
        this.g.get(i).add(null);
      }
    }
  }

  void setTile(int i, int j, Tile t) {
    this.g.get(i).set(j, t);
  }
  
  Tile getTile(int i, int j) {
    return this.g.get(i).get(j);
  }
  
  Tile getTile(Coord c) {
    return this.g.get(c.getX()).get(c.getY());
  }

  ArrayList<Coord> getCoords(int i, int j) {
    ArrayList<Coord> coords = new ArrayList<Coord>();
    for (int k = -1; k < 2; k++) {
      int cx = i + k;
      if (cx >= 0 && cx < w) {
        for (int l = -1; l < 2; l++) {         
          int cy = j + l;
          if (cy >= 0 && cy < h && !(k == 0 && l == 0)) {
             coords.add(new Coord(cx, cy)); 
          }
        }
      }
    }
    return coords;
  }
  
  int numMinesSurrounding(Coord c) {
    return numMinesSurrounding(c.getX(), c.getY());
  }

  int numMinesSurrounding(int i, int j) {
    if (i < 0 || i >= w || j < 0 || j >= h) {
      return -1;
    }
    int numSurrounding = 0;
    ArrayList<Coord> coords = getCoords(i, j);
    for (Coord c : coords) {
        Tile t = getTile(c);
        if (t.isMine()) {
          numSurrounding++;
        }
    }
    return numSurrounding;
  }
  
  void addressClicks(Coord c) {
    addressClicks(new ArrayList<Coord>(), c.getX(), c.getY());
  }
  
  void addressClicks(ArrayList<Coord> addressed, int x, int y) {
     Tile t = getTile(x, y);
     addressed.add(new Coord(x, y));
     if (t.isBlank()) {
       t.setClicked(true);
        ArrayList<Coord> coords = getCoords(x, y);
        for (Coord c : coords) {
           if (!addressed.contains(c)) {
              addressClicks(addressed, c.getX(), c.getY());
           }
        }
     } else if (!t.isMine()) {
         t.setClicked(true);
     }
  }
}
