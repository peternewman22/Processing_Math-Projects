/*
First iteration: angled line, boxes dx, overestimating and underestimating
 Work out the equation of my line
 Text of total area?
 Slider for the value of dx?
 */

void settings() {
  size(720, 720);
}

int res, start, end;
float m, b, x, dx;
ArrayList<Float> yvals_l;
ArrayList<Float> yvals_u;

void setup() {
  noFill();
  start = 4*height/5;
  end = height/5;
  float dy = end- start;
  println(dy);
  m = dy/width;
  b = start;
  x = 1;
  println(m);
  res = 90;
  dx = width/res;
  yvals_l = new ArrayList<Float>();
  yvals_u = new ArrayList<Float>();
  //immediately store the starting point
  yvals_l.add(m*x+b);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(2);
  line(0, start, width, end);
  strokeWeight(1);
  float y = m*x + b;
 
  line(x, y, x, height);
  
  // if x is some multiple of dx, store the y value at that point and then draw a rectangle under the line (and then over the line)
  
  if (x%dx == 0 & x <= width){
    yvals_l.add(y);
    yvals_u.add(y);
  }
  
  //draw lower rectangles
  for (int i = 0; i < yvals_l.size(); i++){
    float yp = yvals_l.get(i);
    //draw lower
    rect(i*dx,yp,dx,height-yp);
  }
  
  for(int i = 0; i < yvals_u.size();i++){
    float yp = yvals_u.get(i);
    rect(i*dx,yp,dx,height-yp);
  }
  
  //draw upper rectangles

  x+=1;
  
 // println(x, y);
 if(x >= width){
   noLoop();
 }
}
