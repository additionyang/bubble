
boolean array = true;
int num0 = 5;
int num = 300;

float[] _x = new float [num];
float[] _y = new float [num];
float[] _j = new float [num];
float[] _k = new float [num];
float[] d = new float [num];
color[] c = new color [num];
color[] c1 = new color [num];
color[] c2 = new color [num];
PImage img;
PImage img2;
PImage img3;
int t = 0;
int t1 = 0;
int t2 = 0;

float a = 20.0;
float da = 1;
float originalangle = 60;
float BG_GRA_STEP_SIZE = 5.0;
float MAX_BUBBLE_RADIOUS = 20.0;
float MAX_BUBBLE_X_SPEED = 10;
float BUBBLE_Y_SPEED = 16.0;
float NEW_BUBBLE_RATE = 0.9;
ArrayList<Bubble> bubbles;
import java.util.Calendar;




void setup() {
  size(2600, 1400, P2D);
  background(0);
  img = loadImage("transparent.png");  
  img2 = loadImage("bg.png");
  img3 = loadImage("fog1.png");

  bubbles = new ArrayList<Bubble>();
  for (int i = 0; i < 10; i++) {
    bubbles.add(new Bubble());
  }
}



void draw() {


  //bubble


    background(0);
    frameRate(70);
    for (Bubble bubble : bubbles) {
      bubble.draw();
    }
    for (Bubble bubble : bubbles) {
      bubble.update();
    }

    ArrayList<Integer> removalBubbleIdxes = new ArrayList<Integer>();
    for (int i = 0; i < bubbles.size(); i++) {
      if (bubbles.get(i).isReachedSurface()) {
        removalBubbleIdxes.add(i);
      }
    }
    for (int i : removalBubbleIdxes) {
      bubbles.remove(i);
    }

    if (random(1) < NEW_BUBBLE_RATE) {
      bubbles.add(new Bubble());
    }


    //wave

    noFill();
    translate(0, height/2-600);
    for (int i = 0; i < 10; i++) {

      float angle = originalangle;
      float noise1 = random(1);
      float x = -noise1*60;
      float noise2 = random(10);
      float mX = 0;
      float mY = a  *noise(noise2)   *sin(radians(angle)/20)   +noise1*3;

      stroke(255, 98);
      strokeWeight(0.5);


      while (x < width) {
        angle += 10;    
        x += 10; 
        float y = a    *noise(noise2)  *sin(radians(angle)*3/8)    +noise1*3; 
        fill(0);   
        line(mX, mY, x, y);
        mX = x;
        mY = y;
      }
    }
    if (a <= -120 || a >= 120) {
      da *= -1;
    }
    a += da;
    originalangle += 10 ;

}



// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("stateofmind", now);
}
