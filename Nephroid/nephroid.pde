float D, R, t;
PVector anchor, diam;


void setup() {
  size(1280, 1280);
  noFill();
  stroke(255);
  strokeWeight(1);
  D = 3*width/5;
  R = D/2;
  t = 0;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, D, D);
  float x = R*cos(t);
  float y = R*sin(t);
  PVector point = new PVector(x, y);
  ellipse(point.x, point.y, 10, 10);
  if ((t<HALF_PI) || (t > 3*HALF_PI)) {
    anchor = new PVector(R, 0);
    diam = PVector.sub(new PVector(-R, 0), anchor);
  } else {
    anchor = new PVector(-R, 0);
    diam = PVector.sub(new PVector(R, 0), anchor);
  }
  // I want the scalar projection of 
  PVector PQ = PVector.sub(point, anchor);
  diam.normalize();
  diam.mult(PQ.dot(diam));
  PVector normalPoint = PVector.add(anchor, diam);
  //now that we have the normal point, we can find how far it is
  float r = PVector.sub(normalPoint, PQ).mag();
  ellipse(point.x, point.y, r, r);


    popMatrix();
  t += 0.01;
  if (t >= TWO_PI) {
    t = 0;
  }
}
