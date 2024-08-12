int HEIGHT = 500;
int WIDTH = 500;

Game g;

void setup() {
  size(500, 500);
  background(255);
  g = new Game(500, 500, 60);
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
