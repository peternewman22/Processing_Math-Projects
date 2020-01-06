import peasy.*;

void settings(){
  size(720, 720, P3D);
}

float a, u, v;

void setup(){
  noStroke();
  smooth();
}

void draw(){
  background(0);
  pushMatrix();
    translate(width/2, height/2);
  popMatrix();
  
}
