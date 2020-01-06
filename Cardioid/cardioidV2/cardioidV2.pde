void settings(){
  size(720,720);
}

float D, r, theta, rate;
ArrayList<PVector> drawme;


void setup(){
  D = 200;
  r = D/2;
  theta = -HALF_PI;
  rate = TWO_PI/1000;
  drawme = new ArrayList<PVector>();
  
  noFill();

}

void draw(){
  background(0);
  pushMatrix();
    translate(width/2, height/2);
    stroke(255);
    strokeWeight(2);
    
    ellipse(0,0,D,D);
    
    PVector centre = new PVector(r*cos(theta), r*sin(theta));
    PVector anchor = new PVector(0,-r);
    float radius = PVector.sub(centre, anchor).mag();
       
    ellipse(centre.x, centre.y, 2*radius,2*radius);
    //if(frameCount%10 == 0){
    //  ellipse(centre.x, centre.y, 2*radius,2*radius);
    //}
    
    //store the centrepoint and the radius inside a 3D vector
    //also, stop adding new circles to draw once we get all the way around
    if(frameCount%10 == 0 & theta < TWO_PI){
      drawme.add(new PVector(centre.x,centre.y,2*radius));
    //  ellipse(centre.x, centre.y, 2*radius,2*radius);
    }
    
    strokeWeight(5);
    point(centre.x, centre.y);
    
  popMatrix();
  
  theta += rate;
  
  drawCircles();
  
}

void drawCircles(){
  // draw each circle using x, y (centre points) and z: diameter)
  strokeWeight(1);
  stroke(255,100);
  pushMatrix();
  translate(width/2, height/2);
  for (PVector thing : drawme){
    ellipse(thing.x,thing.y,thing.z, thing.z);
  }
  popMatrix();
}
