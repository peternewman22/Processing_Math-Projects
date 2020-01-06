import controlP5.*;

void settings() {
  size(720, 720);
}

float a, t;
ArrayList<PVector> verts;
ControlP5 cp5;
int slider = 300;

void setup() {
  
  t = 0;
  verts = new ArrayList<PVector>();
  noFill();
  cp5 = new ControlP5(this);
  cp5.addSlider("a").setPosition(width/8, height/8).setRange(60,360);
  a = slider;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);

  //calculate x and y
  float x = a*cos(t);
  float y = a*pow(sin(t), 3);
  PVector loc = new PVector(x, y);
  //store the location until we're done
  if (t < TWO_PI) {
    verts.add(loc);
  }
  stroke(255);
  strokeWeight(5);
  point(loc.x, loc.y);

  //draw shape so far
  stroke(255, 100);
  strokeWeight(1);
  beginShape();
  for (PVector locs : verts) {
    vertex(locs.x, locs.y);
  }
  endShape();

  popMatrix();
  t += 0.01;
}
