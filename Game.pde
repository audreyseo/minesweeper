class Game {
  ArrayList<Tile> tiles = new ArrayList<Tile>();
  int w, h;
  boolean hover = false;
  Grid g;
  int num;
  boolean flagMode = false;

  static final int TILE_SIZE = 30;

  Game(int wid, int hei, int numMines) {
    this.w = wid;
    this.h = hei;
    this.num = numMines;

    int tx = wid / TILE_SIZE;
    int ty = hei / TILE_SIZE;
    g = new Grid(tx, ty);
    for (int i = 0; i < tx; i++) {
      for (int j = 0; j < ty; j++) {
        Tile t = new Tile(i, j, i * TILE_SIZE, j * TILE_SIZE, TILE_SIZE);
        tiles.add(t);
        g.setTile(i, j, t);
      }
    }

    ArrayList<Tile> mines = new ArrayList<Tile>();
    int nextX = int(random(tx));
    int nextY = int(random(ty));
    while (mines.size() < numMines) {
      Tile t = g.getTile(nextX, nextY);
      if (!mines.contains(t)) {
        mines.add(t);
      }
      nextX = int(random(tx));
      nextY = int(random(ty));
    }

    for (Tile m : mines) {
      m.setArmed(true);
    }

    for (Tile t : tiles) {
      if (!t.isMine()) {
        int n = g.numMinesSurrounding(t.getCoordinate());
        if (n > 0) {
          t.setContents(str(n));
        }
      }
    }
  }

  private Tile coordToTile(Coord c) {
    return coordToTile(c.getX(), c.getY());
  }

  private Tile coordToTile(int x, int y) {
    int x1 = x / TILE_SIZE;
    int y1 = y / TILE_SIZE;

    return this.g.getTile(x1, y1);
  }

  void draw(int mx, int my) {
    for (Tile t : tiles) {
      t.draw();
      if (hover) {
        t.drawHover(mx, my);
      }
    }
  }


  void setHover(boolean b) {
    hover = b;
  }

  boolean getHover() {
    return hover;
  }

  void setFlagMode(boolean b) {
    flagMode = b;
  }

  boolean getFlagMode() {
    return flagMode;
  }
  
  

  void addressClicks(int x, int y) {
    Tile t = coordToTile(x, y);
    if (!t.getFlagged() && t.wasClicked(x, y)) {
      this.g.addressClicks(t.getCoordinate());
    }
    //for (Tile t : tiles) {
    //  if (!t.getFlagged() && t.wasClicked(mouseX, mouseY)) {
    //    this.g.addressClicks(t.getCoordinate());
    //    return;
    //  }
    //}
  }

  void flagTile(int x, int y) {
    Tile t = coordToTile(x, y);
    t.setFlagged(!t.getFlagged());
  }
}
