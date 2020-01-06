float D, R, r, t;
PVector anchor1, anchor2, diam1, diam2;

void setup() {
  size(1280, 1280);

  stroke(255);
  strokeWeight(1);
  D = 3*width/5;
  R = D/2;
  t = 0;
  anchor1 = new PVector(R, 0);
  anchor2 = new PVector(-R, 0);
  diam1 = PVector.sub(anchor1, anchor2);
  diam2 = PVector.sub(anchor2, anchor1);
}

void draw() {
  background(0);
  noFill();
  pushMatrix();
  // move to the middle
  translate(width/2, height/2);
  //draw ellipse with line
  ellipse(0, 0, D, D);
  line(anchor1.x, anchor1.y, anchor2.x, anchor2.y);
  // calculate the point we'll be centering our circles from
  PVector P = new PVector(R*cos(t), R*sin(t));
  //draw that point
  fill(255);
  ellipse(P.x, P.y, 10, 10);
  noFill();

  // draw ellipse from point to anchor 1 OR anchor 2
  if ((t <= HALF_PI) || (t>=3*HALF_PI)) {

    fill(255,0,0);
    
    PVector ap = PVector.sub(P, diam); 
    PVector normP = diam.normalize().setMag(ap.dot(diam));
    PVector normalPoint = PVector.sub(anchor1, normP);
    line(P.x, P.y, normalPoint.x, normalPoint.y);
    ellipse(normalPoint.x, normalPoint.y, 10, 10);
    //ellipse(d.x, d.y, 10, 10);
    //float r = PVector.sub(P, d).mag();
    noFill();
    //ellipse(P.x, P.y, 2*r, 2*r);
    //line(P.x, P.y, d.x, d.y);
  } else {

    fill(255,0,0);
    //ellipse(d.x, d.y, 10, 10);
    //float r = PVector.sub(P, d).mag();
    //ellipse(P.x, P.y, 2*r, 2*r);
    //line(P.x, P.y, d.x, d.y);
  }





  popMatrix();

  //increment t
  t += 0.01;
  if (t >= TWO_PI) {
    t = 0;
  }
}
