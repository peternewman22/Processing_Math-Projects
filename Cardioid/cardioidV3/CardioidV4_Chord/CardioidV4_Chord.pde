void settings() {
  size(720, 720);
}

float D, r;
int n;
float[] node_angles;
int iter;

void setup() {
  D = 600;
  r = D/2;
  iter = 0;

  noFill();
  n = 30;
  node_angles = new float[n];


  // store nodes in an array
  for (int i = 0; i < node_angles.length; i++) {
    node_angles[i] = i*TWO_PI/n;
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(1);
  ellipse(0, 0, D, D);
  //drawing the points
  for (int i = 0; i < node_angles.length; i++) {
    float theta = node_angles[i];
    //float x1 = r*cos(theta);
    //float y1 = r*cos(theta);
    //float x2 = r*cos(2*theta);
    //float y2 = r*sin(2*theta);
    strokeWeight(10);
    point(r*cos(theta), r*sin(theta));
    //strokeWeight(2);
    //line(x1,y1,x2,y2);
  }

 
  popMatrix();
}
