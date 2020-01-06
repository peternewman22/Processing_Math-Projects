void settings() {
  size(720, 720);
}

float D, r, angle;
int resolution;
ArrayList<PVector> pedals;
ArrayList<PVector> circs;

void setup() {
  D = 500;
  r = D/2;
  angle = 0;
  noFill();
  pedals = new ArrayList<PVector>();
  circs = new ArrayList<PVector>();

  resolution = 5;
  
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  rotate(-HALF_PI);

  //draw circle
  stroke(255);
  strokeWeight(1);
  ellipse(0, 0, D, D);

  // calculate the point on the circumference
  float xc = r*cos(angle);
  float yc = r*sin(angle);
  strokeWeight(5);
  point(xc, yc);
  point(r, 0);

  //calculate pedal point
  float xp = r*(cos(angle)+pow(sin(angle), 2));
  float yp = r*(1-cos(angle))*sin(angle);
  point(xp, yp);

  //draw in lines
  strokeWeight(1);
  line(r, 0, xp, yp);
  line(xc, yc, xp, yp);

  // every 10 frames (and we haven't gone all the way around, store the pedal point
  if (frameCount%2 == 0 & angle < TWO_PI) {
    pedals.add(new PVector(xp, yp));
    circs.add(new PVector(xc, yc));
  }

  //draw all the things
  stroke(255,100);
  for (int i = 0; i < pedals.size(); i++){
    PVector ploc = pedals.get(i);
    PVector cloc = circs.get(i); 
    line(r, 0, ploc.x, ploc.y);
    line(cloc.x, cloc.y, ploc.x, ploc.y);
  }


  popMatrix();

  angle += 0.01;
}
