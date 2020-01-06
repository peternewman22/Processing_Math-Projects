float phase1, phase2, phase3, increment, K, yScale, offset, initPhase1, initPhase2, initPhase3;
PVector[] wave1, wave2, wave3;
int arrayLength, omega;

void setup() {
  size(2400, 720);
  strokeWeight(2);
  K = 0.005;
  omega = 10;
  phase1 = 0;
  phase2 = 6;
  phase3 = 2;
  offset = 40;
  increment = 0.02;
  yScale = 150;
  arrayLength = 2000;
  initPhase1 = 0;
  initPhase2 = 1;
  initPhase3 = 2;
  noFill();

  //setting up the arrays and add the first values
  wave1 = new PVector[arrayLength];
  wave2 = new PVector[arrayLength];
  wave3 = new PVector[arrayLength];
  wave1[0] = new PVector(0 + offset, sin(0 + initPhase1), initPhase1); //start ith a phase offset of 0 and store it z
  wave2[0] = new PVector(0 + offset, sin(0 + initPhase2), initPhase2); //start with a phase offset of PI/3 and store it in z
  wave3[0] = new PVector(0 + offset, sin(0 + initPhase3), initPhase3); // start with a phase offset of 2*PI/3 and store it in z

  //generating the rest of the point array, starting from 1. Phases based on the previous.
  for (int i = 1; i < arrayLength; i++) {
    float x = i*increment;
    float phase1 = wave1[i-1].z + K*(sin(wave2[i-1].z - wave1[i-1].z) + sin(wave3[i-1].z - wave1[i-1].z));
    float phase2 = wave2[i-1].z + K*(sin(wave1[i-1].z - wave2[i-1].z) + sin(wave3[i-1].z - wave2[i-1].z));
    float phase3 = wave3[i-1].z + K*(sin(wave2[i-1].z - wave3[i-1].z) + sin(wave1[i-1].z - wave3[i-1].z));

    //store them
    wave1[i] = new PVector(i*x + offset, yScale*sin(omega*x + phase1), phase1);
    wave2[i] = new PVector(i*x + offset, yScale*sin(omega*x + phase2), phase2);
    wave3[i] = new PVector(i*x + offset, yScale*sin(omega*x + phase3), phase3);
  };
  println("Successfully generated waves");
}

void draw() {
  background(0);
  render(wave1, color(255, 0, 0));
  render(wave2, color(0, 255, 0));
  render(wave3, color(0, 0, 255));
}


void render(PVector[] pointArray, color colour) {
  stroke(colour);
  pushMatrix();
  translate(0, height/2);
  beginShape();
  for (PVector v : pointArray) {
    vertex(v.x, v.y);
  };
  endShape();
  popMatrix();
};
