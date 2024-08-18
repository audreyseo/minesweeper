import java.util.function.Supplier;

abstract class StatusBarItem {
  int yDiff = 0;
  void draw(float xspace, boolean on) {
  }
  
  void setYDiff(int n) {
    yDiff = n;
  }
}

class StatusBarInfo extends StatusBarItem {
  Supplier<String> info;
  
  StatusBarInfo(Supplier<String> s) {
    info = s;
  }
  
  void draw(float xspace, boolean on) {
    textAlign(CENTER);
    fill(0);
    text(info.get(), xspace / 2, yDiff);
  }
}

class StatusBarLambda<T> extends StatusBarItem {
  Supplier<T> drawOn, drawOff;
  StatusBarLambda(Supplier<T> d, Supplier<T> d1) {
    drawOn = d;
    drawOff = d1;
  }
  
  void draw(float xspace, boolean on) {
    translate(xspace / 2, yDiff);
    if (on) {
      drawOn.get();
    } else {
      drawOff.get();
    }
  }
}

class StatusBarIcon extends StatusBarItem {
  PImage img, inverted;
  String imgFileName;
  int width, height;
  int displayW, displayH;

  StatusBarIcon(String imgName, int w, int h, int displayW, int displayH) {
    this.width = w;
    this.height = h;
    this.displayW = displayW;
    this.displayH = displayH;
    imgFileName = imgName;

    img = loadImage(imgName);

    inverted = createImage(w, h, ARGB);

    for (int i = 0; i < img.pixels.length; i++) {
      color pixel = img.pixels[i];
      float alpha = alpha(pixel);
      float r = red(pixel);
      float gr = green(pixel);
      float b = blue(pixel);
      if (alpha < 255) {
        inverted.pixels[i] = pixel;
      } else {
        inverted.pixels[i] = color(255 - r, 255 - gr, 255 - b, alpha);
      }
    }
  }

  void draw(float xspace, boolean on) {
    if (on) {
      image(img, xspace / 2, yDiff, displayW, displayH);
    } else {
      image(this.inverted, xspace / 2, yDiff, displayW, displayH);
    }
  }
}
