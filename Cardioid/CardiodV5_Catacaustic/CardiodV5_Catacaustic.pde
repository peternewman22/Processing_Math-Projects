void settings() {
  size(720, 720);
}

float D, r, angle;

void setup() {
  D = 650;
  r = D/2;
  angle = 0;
  noFill();
}

void draw() {
  background(0);
  pushMatrix();
  //move to the middle
  translate(width/2, height/2);
  
  //draw the cirlce
  stroke(255);
  strokeWeight(1);
  ellipse(0, 0, D, D);
  
  //calculate the point on the circumference
  float cx = r*cos(angle);
  float cy = r*sin(angle);
  strokeWeight(5);
  point(cx, cy);
  
  //calculate the point on the catacaustic
  float catx = r*((2/3)*cos(angle)*(1+cos(angle))-1/3);
  float caty = r*(2/3)*sin(angle)*(1+cos(angle));
  point(catx, caty);
  
  popMatrix();

  angle += 0.01;
}
