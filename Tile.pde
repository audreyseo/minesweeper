class Tile {
  Coord c;
  int x, y;
  int w;
  boolean clicked = false;
  boolean armed = false;
  String contents = "";

  Tile(int x_index, int y_index, int x, int y, int w) {
    this.x = x;
    this.y = y;
    this.w = w;
    c = new Coord(x_index, y_index);
  }

  Coord getCoordinate() {
    return this.c;
  }

  void setContents(String c) {
    this.contents = c;
  }

  boolean isBlank() {
    return this.contents.length() == 0;
  }

  void setArmed(boolean b) {
    armed = b;
  }

  void draw() {
    stroke(0);
    if (clicked) {
      if (isBlank()) {
         fill(200);
      } else {
         fill(175); 
      }
    } else {
      fill(255);
    }
    rect(x, y, w, w);

    if (clicked) {
      if (armed) {
        fill(0);
        textAlign(CENTER);
        text("B", x + w / 2, y + 0.75 * w);
      } else if (!isBlank()) {
        int n = int(this.contents);
        if (n == 1) {
          fill(0, 0, 255);
        } else if (n == 2) {
          fill(0, 255, 0);
        } else if (n == 3) {
          fill(255, 0, 0);
        } else {
          fill(0);
        }
        textAlign(CENTER);
        text(contents, x+ w / 2, y + 0.75 * w);
      }
    }
  }

  void drawHover(int mx, int my) {
    if (inside(mx, my)) {
      noStroke();
      fill(255, 0, 0, 120);
      rect(x, y, w, w);
    }
  }

  boolean isMine() {
    return armed;
  }

  void setClicked(boolean b) {
    this.clicked = b;
  }



  void wasClicked(int x, int y) {
    if (inside(x, y)) {
      this.clicked = true;
    }
  }

  boolean inside(int x, int y) {
    return (this.x <= x && x < this.x + this.w) && (this.y <= y && y < this.y + this.w);
  }
}
