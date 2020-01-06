float W, H, i, rate;
boolean advancing;
ArrayList<Float> line_pos;

void setup() {
  size(720, 720, P2D);
  W = width/2;
  H = height/2;
  rate = 1;
  stroke(255);
  advancing = true;
  line_pos = new ArrayList<Float>();
}

void draw() {
  background(0);
  pushMatrix();
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  translate(W, H);
  //start drawing lines
  line(0, i-H, -i, 0);
  line(0, i-H, i, 0);
  line(0, H-i, -i, 0);
  line(0, H-i, i, 0);

  if ((frameCount%5 == 0) && (line_pos.size() <= W/5)) {
    line_pos.add(i);
  }
 

  for (float ln : line_pos) {
    line(0, ln-H, -ln, 0);
    line(0, ln-H, ln, 0);
    line(0, H-ln, -ln, 0);
    line(0, H-ln, ln, 0);
  }

  popMatrix();
  if (advancing) {
    i += rate;
  } else {
    i -= rate;
  }


  if (i >= H) {
    advancing = false;
  } else if (i <= 0) {
    advancing = true;
  }
}
