class Bubble {

  float x;
  float y;
  float radious;

  Bubble() {
    radious = random(MAX_BUBBLE_RADIOUS);
    x = width / 2.0;
    y = (height + radious)*random(0.95, 1.2);
  }

  void draw() {
    stroke(255);
    strokeWeight(.8);
    noFill();
    arc(x, y, radious, radious, 0, 2.0 * PI);
    float near = dist(x, y, mouseX, mouseY);
    if (mousePressed) {
      if (near <= 30) {

        float gg = random(50)+40;
        noStroke();
        fill(255, 10);        
        ellipse(x, y, radious+gg, radious+gg);
        ellipse(x, y, radious+gg-24, radious+gg-24);
        ellipse(x, y, radious+gg-20, radious+gg-20);

        for (int y=0; y<height; y++) 
          for (int x=0; x<width; x++) { 

            color myPixel = get(x, y); 
            int r = int(red(myPixel)); 
            int g = int(green(myPixel)); 
            int b = int(blue(myPixel)); 

            color hue = color(r, g, b+40); 
            set(x, y, hue);
          }
        /*
         float g = random(50)+40;
         float f = random(-400,400);
         noStroke();
         fill(255, 10);        
         ellipse(x, y, radious+g, radious+g);
         ellipse(x+f, y, radious+g, radious+g);
         ellipse(x+f, y, radious+g-27, radious+g-27);
         ellipse(x+f, y, radious+g-24, radious+g-24);
         ellipse(x+f, y, radious+g-20, radious+g-20);
         */
      }
    }
  }

  void update() {
    x += random(MAX_BUBBLE_X_SPEED * random(1.8, 2.2)) - MAX_BUBBLE_X_SPEED;
    y -= BUBBLE_Y_SPEED * random(0.8, 1.2);
  }

  boolean isReachedSurface() {
    if (y <= 120) {
      return true;
    } else {
      return false;
    }
  }
}
