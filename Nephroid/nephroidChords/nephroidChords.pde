
float D, r, angle;
int N, n, it, drawRate, leadRate;
float[] nodes;
ArrayList<Integer> chords;

void setup() {
  size(1280, 1280, P2D);
  drawRate = 5;
  D = 7*1280/8;
  r = D/2;
  noFill();
  N = 270;
  n = N/2;
  it = 1;
  leadRate = 9;
  nodes = new float[N];
  angle = TWO_PI/N;
  // collecting n node positions at i*TWO_PI/n
  for (int i =0; i < nodes.length; i++) {
    float node_angle = i*angle;
    nodes[i] = node_angle;
  } 
  //printArray(nodes);
  chords = new ArrayList<Integer>();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(1);
  ellipse(0, 0, D, D);

  //plot nodes
  for (int i =0; i < nodes.length; i++) {
    float theta = nodes[i];
    strokeWeight(8);
    point(r*cos(theta), r*sin(theta));
  }
  //generate start and end points of chord
  float x1 = r*cos(it*angle);
  float y1 = r*sin(it*angle);
  float x2 = r*cos(leadRate*it*angle);
  float y2 = r*sin(leadRate*it*angle);

  //every drawRate frames, recalculate end points
  
  if (frameCount%drawRate == 0) {
    it ++;
    x1 = r*cos(it*angle);
    y1 = r*sin(it*angle);
    x2 = r*cos(leadRate*it*angle);
    y2 = r*sin(leadRate*it*angle);
    
    //store it in ArrayList until we've gone through the whole thing once
    //this happens at it = 2N
    if (it < N) {
      chords.add(it);
    }
  }
  //draw the envelope
  stroke(255, 100);
  strokeWeight(2);
  for (int iter : chords) {
    float e_x1 = r*cos(iter*angle);
    float e_y1 = r*sin(iter*angle);
    float e_x2 = r*cos(leadRate*iter*angle);
    float e_y2 = r*sin(leadRate*iter*angle);
    line(e_x1, e_y1, e_x2, e_y2);
  }

  //draw line
  stroke(255);
  strokeWeight(2);
  line(x1, y1, x2, y2);
  //line(r*cos(it*angle), r*sin(it*angle), r*cos(2*it*angle), r*sin(2*it*angle));
}
