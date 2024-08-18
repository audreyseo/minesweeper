class StatusBar {
  Game g;
  int totalMines;
  PImage xray, xrayInv;
  
  float ratio;
  float begin;

  static final int xraySize = 15;
  
  ArrayList<StatusBarItem> items = new ArrayList<StatusBarItem>();
  ArrayList<Supplier<Boolean>> itemBools = new ArrayList<>();

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
    itemBools.add(() -> g.getFlagMode());
    
    items.add(new StatusBarInfo(() -> str(g.getNumFlagged()) + " / " + str(this.totalMines)));
    itemBools.add(() -> true);
    
    items.add(new StatusBarIcon("xrayicon.png", 512, 512, xraySize, xraySize));
    itemBools.add(() -> g.getXrayMode());
    
    items.add(new StatusBarInfo(() -> "Hover: " + str(g.hover)));
    itemBools.add(() -> true);
    
    items.get(0).setYDiff(2);
    items.get(1).setYDiff(15);
    items.get(2).setYDiff(2);
    items.get(3).setYDiff(15);
    
    float sz = ((float) items.size() + 1);
    
    ratio = 2.0 / sz;
    begin = 1.0 / sz;
  }

  void draw() {
    
    pushMatrix();
    translate(0, g.h);
    for (int i = 0; i < items.size(); i++) {
       pushMatrix();
       translate(i * begin * g.w, 0);
       items.get(i).draw(g.w * ratio, itemBools.get(i).get());
       popMatrix();
    }
    
        
    popMatrix();
    
    ////int minesFound = g.getNumFlagged();

    ////fill(0);

    ////textAlign(CENTER);
    ////text(str(minesFound) + " / " + str(totalMines), g.w / 2, g.h + 15);

    //pushMatrix();
    //translate(0, g.h + 2);
    //items.get(0).draw(g.w * 0.5, g.getFlagMode());
    //popMatrix();
    
    //pushMatrix();
    //translate(g.w * 0.25, g.h + 15);
    //items.get(1).draw(g.w * 0.5, true);
    //popMatrix();

    ////pushMatrix();
    ////if (g.getFlagMode()) {
    ////  redFlagStyle();
    ////} else {
    ////  flagOutlineStyle();
    ////}
    ////translate(g.w / 4, g.h + 2);
    ////drawFlag(25);
    ////popMatrix();


    //pushMatrix();
    //translate(g.w * 0.5, g.h + 2);
    //items.get(2).draw(g.w * 0.5, g.getXrayMode());
    ////if (g.getXrayMode()) {
    ////  image(xray, 0, 0, xraySize, xraySize);
    ////} else {
    ////  image(xrayInv, 0, 0, xraySize, xraySize);
    ////}
    //popMatrix();
  }
}
