int HEIGHT = 600;
int WIDTH = 600;

Game g;

void setup() {
  size(600, 600);
  background(255);
  g = new Game(600, 600, 60);
}

void draw() {
  background(255);

  g.draw(mouseX, mouseY);
}


void mouseClicked() {
  g.addressClicks();
}

void keyReleased() {
  println(key);
  if (key == 'h' || key == 'H') {
    println(g.getHover());
    g.setHover(!g.getHover());
  }
}
