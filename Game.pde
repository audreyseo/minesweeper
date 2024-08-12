class Game {
  ArrayList<Tile> tiles = new ArrayList<Tile>();
  int w, h;
  boolean hover = false;
  Grid g;
  int num;

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

  void addressClicks() {
    for (Tile t : tiles) {
      if (t.wasClicked(mouseX, mouseY)) {
        this.g.addressClicks(t.getCoordinate());
        return;
      }
    }
  }
}
