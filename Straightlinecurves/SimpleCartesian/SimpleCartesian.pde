import controlP5.*;
ControlP5 cp5;

int slider;
float spacing;


void setup() {
  size(1280, 1280);
  stroke(255);
  strokeWeight(1);
  cp5 = new ControlP5(this);
  slider = 10;
  cp5.addSlider("slider").setRange(10,100).setPosition(width/20, height/20);
  
}



void draw() {
  background(0);
  spacing = height/(2*slider);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  //ellipse(spacing, height/2, 10, 10);
  for (int i = 0; i < 2*slider; i++) {
    ellipse(width/2, i*spacing, 5, 5);
    ellipse(i*spacing, height/2, 5, 5);
    //line(width/2, i*spacing, width/2 - i*spacing, height/2);
  }

  for (int i = 0; i < slider+1; i++) {
    ellipse(width/2, i*spacing, 5, 5);
    ellipse(i*spacing, height/2, 5, 5);
    line(width/2, i*spacing, width/2 - i*spacing, height/2);
    line(width/2, i*spacing, width/2+i*spacing, height/2);
    line(width/2, height-i*spacing, width/2 - i*spacing, height/2);
    line(width/2, height-i*spacing, width/2+i*spacing, height/2);
  }
}
