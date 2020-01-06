/*
First iteration: angled line, boxes dx, overestimating and underestimating
 Work out the equation of my line
 Text of total area?
 Slider for the value of dx?
 */

void settings() {
  size(1280, 720, P2D);
}

int res, start, end;
float a, w, x, dx;
ArrayList<Float> yvals_l;
ArrayList<Float> yvals_u;
float[] yvals_curve;

void setup() {
  noFill();
  x = 1;
  res = 90;
  dx = width/res;
  a = 250;
  w = 0.01;
  yvals_curve = new float[width];
  yvals_l = new ArrayList<Float>();
  yvals_u = new ArrayList<Float>();
  //immediately store the starting point for the lower
  // hard-coded for now
  yvals_l.add(float(height/2));
  
  //make the array to draw the sine wave
  for (int i = 0; i < yvals_curve.length; i++){
    yvals_curve[i] = a*sin(w*i)+height/2;
  }
}

void draw() {
  background(0);
  stroke(255);
  //draw the curve
  beginShape();
  for(int i = 0; i < yvals_curve.length; i++){
    vertex(i,yvals_curve[i]);
  }
  endShape();
  strokeWeight(2);
  line(0, start, width, end);
  strokeWeight(1);

  
  // if x is some multiple of dx, store the y value at that point and then draw a rectangle under the line (and then over the line)
  
 // if (x%dx == 0 & x <= width){
 //   yvals_l.add(y);
 //   yvals_u.add(y);
 // }
  
 // //draw lower rectangles
 // for (int i = 0; i < yvals_l.size(); i++){
 //   float yp = yvals_l.get(i);
 //   //draw lower
 //   rect(i*dx,yp,dx,height-yp);
 // }
  
 // for(int i = 0; i < yvals_u.size();i++){
 //   float yp = yvals_u.get(i);
 //   rect(i*dx,yp,dx,height-yp);
 // }
  
 // //draw upper rectangles

 // x+=1;
  
 //// println(x, y);
 //if(x >= width){
 //  noLoop();
 //}
}
