/*
Problem Set 4
(UPDATED: mousepressed rotate angle & tree details)

 A Wind-blowing tree shadow
 The wind(controlled by the mouse) will cause the branches to tilt and sway.
 
 By Addition Yang - f34051118
 */

float x=0;
PImage photo;
float t =0;
float r=247;
float g=235;
float b=201;

import java.util.Calendar;
//float fall = 0;

void setup() {
  size(1600, 800);
  photo = loadImage("trzcacak.rs-sad-man-png-4723127-01.png");
  stroke(180);
}



void draw() {

  background(247+t, 235+t, 201+t);
  image(photo, -600, 450);
  translate(width/2, height);
  rotate(radians(5+x/100));
  drawtree(150-t/6, -85, 30);


  if (mousePressed) {


    if (mouseX-pmouseX>0) {
      float q1 = float(mouseX)/ float(width);
      float x1 = lerp( 0, width, q1);
      x =x1/800;
    } 
    if (mouseX-pmouseX<0) {
      float q2 = float(mouseX)/ float(width);
      float x2 = lerp( 800, 0, q2);
      x=-x2/800;
    }
  } else {
    x=0;
  }

  t=t-1;
  println(t);
  if (t<-225) {
    t=0;
  }
}


void drawtree(float l, float a, float b) {
  if (l>40) {
    strokeCap(SQUARE);

    strokeWeight(b);
    line(0, 0, l, 0);
    translate(l, 0);
    rotate(radians(a));
    float mm =0;
    mm++;
    frameRate(3);
    pushMatrix();
    drawtree(l*0.7, -15+x/2+mm, b/7*6);
    drawtree(l*0.7, random(-18, -20)+x/2+mm, b/7*2);
    drawtree(l*0.5, random(10, 11)+x+mm, b/6);
    drawtree(l*0.4, -15+x+mm, b/8);
    drawtree(l*0.5, 10+x, b/6);
    drawtree(l*0.5, -15+x+mm, b/8);
    drawtree(l*0.5, random(40, 41)+x, b/8);
    drawtree(l*0.4, 12+x, b/10);
    pushMatrix();
    drawtree(l*0.4, -12+x, b/10);
    popMatrix();
    popMatrix();

    pushMatrix();
    drawtree(l*0.7, 15+x/2, b/3);
    drawtree(l*0.2, 60+x, b/12);
    drawtree(l*0.2, random(0, 10)+x, b/12);
    pushMatrix();
    drawtree(l*0.4, random(-15, -18)+x, b/7);
    drawtree(l*0.4, -15+x, b/8);
    drawtree(l*0.5, -15+x, b/8);
    drawtree(l*0.5, 16+x, b/8);
    drawtree(l*0.5, 10+x, b/8);
    popMatrix();
    drawtree(l*0.5, 30+x, b/8);
    drawtree(l*0.5, -15+x, b/8);
    pushMatrix();
    drawtree(l*0.3, -15+x, b/7);
    drawtree(l*0.4, -5+x, b/7);
    drawtree(l*0.5, random(-10, -8)+x, b/7);
    drawtree(l*0.5, 16+x, b/7);
    drawtree(l*0.5, 10+x, b/8);
    drawtree(l*0.4, 12+x, b/8);
    popMatrix();
    popMatrix();

    pushMatrix();
    drawtree(l*0.6, -45+x, b/4);
    drawtree(l*0.7, -15+x, b/3);
    drawtree(l*0.6, random(-15, -12)+x, b/6);
    drawtree(l*0.6, 16+x, b/6);
    popMatrix();
    pushMatrix();
    drawtree(l*0.6, -16+x, b/6);
    drawtree(l*0.6, random(-36, -35)+x, b/6);
    drawtree(l*0.6, 30+x, b/7);
    drawtree(l*0.6, 30+x, b/8);
    pushMatrix();
    drawtree(l*0.4, -16+x, b/6);
    drawtree(l*0.4, -30+x, b/6);
    drawtree(l*0.4, random(30, 32)+x, b/7);
    popMatrix();
    popMatrix();
  }
}


void keyPressed() {
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("windytree", now);
}
