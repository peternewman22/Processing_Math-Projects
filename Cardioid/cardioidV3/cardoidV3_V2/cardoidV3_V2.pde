import controlP5.*;

void settings() {
  size(720, 720);
}


float D, r;
int n;
float[] node_locs;
ArrayList<PVector> pairings;

void setup() {

  stroke(255);
  noFill();
  D = 500;
  r = D/2;
  n = 8;
  node_locs = new float[n];
  pairings = new ArrayList<PVector>();

  //store the angular position of each node and draw the points
  for (int i = 0; i < node_locs.length; i++) {
    node_locs[i] = i*TWO_PI/n;
  }

  //calculate pairings
  for (int i =0; i<node_locs.length; i++) {
    for (int j=0; j < node_locs.length; j++) {
      if (node_locs[i] != node_locs[j]) {
        PVector pair = new PVector(node_locs[i], node_locs[j]);
        pairings.add(pair);
      }
    }
  }
  //println("Pairings: ", pairings);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  background(0);
  strokeWeight(1);
  ellipse(0, 0, D, D);
  strokeWeight(5);
  //drawing the points
  for (int i = 0; i < node_locs.length; i++) {
    float x = r*cos(node_locs[i]);
    float y = r*sin(node_locs[i]);
    point(x, y);
   
  strokeWeight(1);
  //drawing the lines
  for (int j = 0; j < pairings.size(); j++){
    float theta1 = pairings.get(j).x;
    float theta2 = pairings.get(j).y;
    float x1 = r*cos(theta1);
    float y1 = r*sin(theta1);
    float x2 = r*cos(theta2);
    float y2 = r*sin(theta2);
    line(x1,y1,x2,y2);
  }
  
  }
  popMatrix();
}
