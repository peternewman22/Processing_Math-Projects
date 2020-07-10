float mercuryOrbitR, mercuryR, mercuryOmega, sunR, a;
float venusOrbitR, venusR, venusOmega;
int s;

void setup(){
  size(720, 720, P2D);
  s = 360;
  mercuryR = 0.05*s;
  mercuryOrbitR = 0.2*s;
  mercuryOmega = 1.0;
  sunR = 0.1*s;
  a = 0;
  venusR = 0.075*s;
  venusOrbitR = 0.3*s;
  venusOmega = 0.75;
  
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  
  // draw the sun
  fill(0xFFF9D71C);
  ellipse(0, 0, sunR, sunR);
  
  //draw mercury
  fill(0xFFa9a9a9);
  ellipse(mercuryOrbitR*cos(mercuryOmega*a), mercuryOrbitR*sin(mercuryOmega*a), mercuryR, mercuryR);
  
  //draw venus
  fill(0xFFc8a2c8);
  ellipse(venusOrbitR*cos(venusOmega*a), venusOrbitR*sin(venusOmega*a), venusR, venusR);
  
  popMatrix();
  a+= 0.01;

}
