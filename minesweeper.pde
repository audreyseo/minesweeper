int HEIGHT = 600;
int WIDTH = 600;

PFont font;

Game g;

StatusBar bar;

void setup() {
  size(600, 620);
  background(255);
  g = new Game(600, 600, 60);
  bar = new StatusBar(g);

  font = createFont("Menlo-Regular", 16, false);
  textFont(font);
}

void draw() {
  background(255);

  g.draw(mouseX, mouseY);
  bar.draw();
}


void mouseClicked() {
  if (g.getFlagMode()) {
    println("Flag mode");
    g.flagTile(mouseX, mouseY);
  } else {
    g.addressClicks(mouseX, mouseY);
  }
}

void keyReleased() {
  println(key);
  if (key == 'h' || key == 'H') {
    //println(g.getHover());
    g.setHover(!g.getHover());
  } else if (key == 'f' || key == 'F') {
    g.setFlagMode(!g.getFlagMode());
  } else if (key == 'x' || key == 'X') {
    g.setXrayMode(!g.getXrayMode());
  }
}


void redFlagStyle() {
  fill(255, 0, 0);
  noStroke();
}

void flagOutlineStyle() {
  noFill();
  stroke(0);
}

void drawFlag(int w) {
  rect(0, 0, w / 10, w * 0.5);
  rect(w/10, 0, w * 0.3, w * 0.3);
}
