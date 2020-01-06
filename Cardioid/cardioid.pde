/*
  1. Draw a circle
  2. Draw a point D*cos(angle), D*sin(angle) away from the centre
*/
float D, r, angle, rate;
ArrayList<PVector> points;

void settings(){
  size(480, 480);
}

void setup(){
  //strokeWeight(2);
  noFill();
  points = new ArrayList<PVector>();
  
  D = 100;
  r = D/2;
  angle = 0;
  rate = 0.02;
}

void draw(){
  background(0);
  stroke(255,100);
  strokeWeight(2);
  pushMatrix();
    translate(width/2, height/2);
    ellipse(0,0, D, D);
    PVector loc = new PVector(D*cos(angle), D*sin(angle));

    point(loc.x, loc.y);
   // pushMatrix();
   //   translate(loc.x, loc.y);
      //ellipse(0,0,D,D);

       ellipse(loc.x,loc.y,D,D);
      float x = loc.x+r*cos(2*angle-PI);
      float y = loc.y+r*sin(2*angle-PI);
      //line(0,0,x,y);
      line(loc.x, loc.y,x,y);
      stroke(255,0,0);
      strokeWeight(5);
      point(x,y);
      //add a point to the array list every second frame if we haven't already gone around
      //if (angle < TWO_PI & frameCount%2 == 0){
      //  points.add(new PVector(x,y));       
      //}
      
      if (angle < TWO_PI){
        points.add(new PVector(x,y));       
      }
      
      
      //point(x,y);
   // popMatrix();
  popMatrix();
  angle += rate;
  draw_cardioid(); 
  
  
}

void draw_cardioid(){
  stroke(255);
  strokeWeight(2);
  pushMatrix();
  translate(width/2,height/2);
    beginShape();
            for(PVector pt : points){
              vertex(pt.x, pt.y);
            }
  endShape();
  popMatrix();
  
}
