/* 
1. Draw ellipse
2. Set mouse point as the raycast origin
*/

void settings(){
  size(720, 720);
}

float D, r;
PVector lloc;
Light lamp;

void setup(){
  D = 600;
  r = D/2;
  noFill();
  
}

void draw(){
  background(0);
  
  lloc = new PVector(mouseX, mouseY);
  lamp = new Light(lloc,TWO_PI/360);
  pushMatrix();
    translate(width/2, height/2);
    
    stroke(255);
    strokeWeight(1);
    ellipse(0,0,D,D);
  popMatrix();
}
