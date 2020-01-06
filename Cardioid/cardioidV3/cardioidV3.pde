void settings() {
  size(720, 720);
}

/*
1. Draw a circle of diameter D
 
 */

float D, r;
int n;
float[] node_locs;
ArrayList<PVector> pairings;

void setup() {
  noFill();
  D = 500;
  r = D/2;
  n = 2;
  node_locs = new float[n];
  pairings = new ArrayList<PVector>();

  // do this once
  for (int i = 0; i < node_locs.length; i++) {
    //float x = r*cos(i*TWO_PI/n);
    //float y = r*sin(i*TWO_PI/n);
    //// store the node in a PVector and store that PVector in 
    //PVector node = new PVector(x, y);
    //node_locs[i] = node;

    // store the angular position
    node_locs[i] = i*TWO_PI/n;
  }
  //println("node locs:");
  //println(node_locs);

  //now we make the cartesian product and store it in the ArrayList
  for (int i = 0; i < node_locs.length; i++) {
    for (int j = 0; j < node_locs.length; j++) {
      if (node_locs[i] != node_locs[j]) {
        //generate pairs by their angular position
        PVector pair = new PVector(node_locs[i], node_locs[j]);
        //store it in the pairings array
        pairings.add(pair);
      }
    }
  }
  println("Pairings:");
  println(pairings);


  background(0);
  stroke(255);
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0, 0, D, D);


  strokeWeight(10);
  //iterate through the array and draw in the nodes at intervals of i*TWO_PI/n
  for (int i = 0; i < node_locs.length; i++) {
    //generate the points for the line on the fly
    float x = r*cos(node_locs[i]);
    float y = r*sin(node_locs[i]);
    point(x, y);
  }
  strokeWeight(2);
  // now go through all the pairing and draw the things
  for (int j = 0; j < pairings.size(); j++) {
    float theta1 = pairings.get(j).x;
    println("theta1: ", theta1);
    float theta2 = pairings.get(j).y;
    println("theta2: ", theta2);
    float x1 = r*cos(theta1);
    float y1 = r*sin(theta1);
    float x2 = r*cos(theta2);
    float y2 = r*cos(theta2);
    line(x2, y2, x1, y1);
  }

  popMatrix();
}

void draw() {
  //background(0);
  //stroke(255);
  //strokeWeight(2);
  //pushMatrix();
  //translate(width/2, height/2);
  //ellipse(0, 0, D, D);


  //strokeWeight(10);
  ////iterate through the array and draw in the nodes at intervals of i*TWO_PI/n
  //for (int i = 0; i < node_locs.length; i++) {
  //  //generate the points for the line on the fly
  //  float x = r*cos(node_locs[i]);
  //  float y = r*sin(node_locs[i]);
  //  point(x, y);
  //}
  //strokeWeight(2);
  //// now go through all the pairing and draw the things
  //for (int j = 0; j < pairings.size(); j++) {
  //  float theta1 = pairings.get(j).x;
  //  println("theta1: ", theta1);
  //  float theta2 = pairings.get(j).y;
  //  println("theta2: ", theta2);
  //  float x1 = r*cos(theta1);
  //  float y1 = r*sin(theta1);
  //  float x2 = r*cos(theta2);
  //  float y2 = r*cos(theta2);
  //  line(x1,y1, x2, y2);
  //}

  //popMatrix();
}
