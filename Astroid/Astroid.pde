float i, j, rate;
boolean advancing;
ArrayList<PVector> ellipses;

void setup() {
  size(1280, 1280, P2D);

  rate = 5;
  advancing = true;
  ellipses = new ArrayList<PVector>();
}

void draw() {
  background(0);
  stroke(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  pushMatrix();
  translate(width/2, height/2);
  noFill();

  // draw ellipses
   for (PVector pos : ellipses) {
    ellipse(0, 0, pos.x, pos.y);
  }
  // start drawing ellipses
  ellipse(0, 0, i, height-i);

  if ((frameCount%5 == 0) && (i < height)) {
    ellipses.add(new PVector(i, height-i));
  }

  



  if (advancing) {
    i += rate;
  } else {
    i -= rate;
  }

  if (i >= height) {
    advancing = false;
  } else if (i <= 0) {
    advancing = true;
  }

  popMatrix();
}
