class StatusBar {
  Game g;
  int totalMines;
  PImage xray, xrayInv;

  static final int xraySize = 15;
  
  ArrayList<StatusBarItem> items = new ArrayList<StatusBarItem>();

  StatusBar(Game g) {
    this.g = g;
    totalMines = g.getNumberOfMines();
    
    items.add(new StatusBarLambda(() -> {
      redFlagStyle();
      drawFlag(25);
      return 0;
    },
    () -> {
      flagOutlineStyle();
      drawFlag(25);
      return 0;
    }));
    
    items.add(new StatusBarInfo(() -> str(g.getNumFlagged()) + " / " + str(this.totalMines)));
    
    items.add(new StatusBarIcon("xrayicon.png", 512, 512, xraySize, xraySize));
    //xray = loadImage("xrayicon.png");

    //xrayInv = createImage(512, 512, ARGB);

    //for (int i = 0; i < xray.pixels.length; i++) {
    //  color pixel = xray.pixels[i];
    //  float alpha = alpha(pixel);
    //  float r = red(pixel);
    //  float gr = green(pixel);
    //  float b = blue(pixel);
    //  if (alpha < 255) {
    //    xrayInv.pixels[i] = pixel;
    //  } else {
    //    xrayInv.pixels[i] = color(255 - r, 255 - gr, 255 - b, alpha);
    //  }
    //}
  }

  void draw() {
    //int minesFound = g.getNumFlagged();

    //fill(0);

    //textAlign(CENTER);
    //text(str(minesFound) + " / " + str(totalMines), g.w / 2, g.h + 15);

    pushMatrix();
    translate(0, g.h + 2);
    items.get(0).draw(g.w * 0.5, g.getFlagMode());
    popMatrix();
    
    pushMatrix();
    translate(g.w * 0.25, g.h + 15);
    items.get(1).draw(g.w * 0.5, true);
    popMatrix();

    //pushMatrix();
    //if (g.getFlagMode()) {
    //  redFlagStyle();
    //} else {
    //  flagOutlineStyle();
    //}
    //translate(g.w / 4, g.h + 2);
    //drawFlag(25);
    //popMatrix();


    pushMatrix();
    translate(g.w * 0.5, g.h + 2);
    items.get(2).draw(g.w * 0.5, g.getXrayMode());
    //if (g.getXrayMode()) {
    //  image(xray, 0, 0, xraySize, xraySize);
    //} else {
    //  image(xrayInv, 0, 0, xraySize, xraySize);
    //}
    popMatrix();
  }
}
