class Wave {
  float increment, initPhase, yScale, K;
  int arrayLength, arrayLimit, omega, offset;
  ArrayList<PVector> pointArray;
  color colour;

  Wave(float initPhase_, color colour_) {
    K = 0.2;
    increment = 0.01;
    initPhase = initPhase_;
    offset = 40;
    yScale = 200;
    omega = 5;
    arrayLength = 1000;
    pointArray = new ArrayList<PVector>();
    pointArray.add(0, new PVector(0 + offset, sin(0 + initPhase), initPhase)); //enter the first value
    arrayLimit = 1000;
    colour = colour_;
  };

  void update(Wave[] waves, int t) {
    float x = t*increment;
    float theta_i = pointArray.get(0).z; //grab the phase from the pointArray
    float sumOfSines = 0; //start a count
    
    for (Wave w : waves) { //for w in waves...
      sumOfSines += sin(w.pointArray.get(0).z - theta_i); //because we're always storing the next thing at the beginning of the array...
      println("adding", sumOfSines);  
  } 
    float phase = theta_i + K*sumOfSines;
    pointArray.add(new PVector(x + offset, sin(omega*x+phase), phase));

    //finally, if the array is getting too big, remove the very last element
    if (pointArray.size() > arrayLimit) {
      pointArray.remove(arrayLimit - 1);
    }
  }



  void render() {
    stroke(colour);
    pushMatrix();
    translate(0, height/2);
    beginShape();
    for (int i = 0; i < pointArray.size(); i++) {
      vertex(i+pointArray.get(i).x, yScale*pointArray.get(i).y);
    }
    endShape();
    popMatrix();
  }
}
