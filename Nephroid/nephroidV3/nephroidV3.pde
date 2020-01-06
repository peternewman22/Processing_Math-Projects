float D, d, R, r, t;
PVector anchor1, anchor2;
ArrayList<PVector> envelope;


void setup() {
  size(1280, 1280, P2D);
 
  stroke(255);
  D = 3*height/7;
  R = D/2;
  anchor1 = new PVector(R, 0 );
  anchor2 = new PVector(-R, 0);
  t = 0;
  
  envelope = new ArrayList<PVector>();
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  ellipse(0, 0, D, D);
  
  //draw in the anchors
  //anchor 1
  fill(255,0,0);
  ellipse(anchor1.x, anchor1.y, 10, 10);
  //anchor 2
  fill(0,255,0);
  ellipse(anchor2.x, anchor2.y, 10, 10);
  line(anchor1.x, anchor1.y, anchor2.x, anchor2.y);
  
  //draw tracking circle
  PVector P = new PVector(R*cos(t), R*sin(t));
  fill(0,0,255);
  ellipse(P.x, P.y, 10, 10);
  
  //find the scalar projection of p onto the diameter
  PVector normalPoint = anchor1.copy();
  normalPoint.normalize();
  normalPoint.mult(P.dot(normalPoint));
  ellipse(normalPoint.x, normalPoint.y, 10, 10);
  
  //draw in the normal point
  noFill();
  float r = PVector.sub(P, normalPoint).mag();
  ellipse(P.x, P.y, 2*r, 2*r);
  
  //store the centre position and radius in a 3D vector
  if((frameCount%5 == 0) && (t <= TWO_PI)){
    envelope.add(new PVector(P.x, P.y, 2*r));
  }
  
  //draw in all the circles
  for(PVector circle : envelope){
    ellipse(circle.x, circle.y, circle.z, circle.z);
  }
  
  popMatrix();
  t += 0.01;
}
