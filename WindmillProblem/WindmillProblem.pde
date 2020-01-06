/* 
 Making a centre of a circle
 Making a line going through them to off screen
 
 */
 float theta, r;
 PVector[] points;
 void setup(){
   size(1280, 1280);
   theta = -PI/2;
   r = 500;
   points = new PVector[2];
   
   
 }
 
 void draw(){
   background(255);
   pushMatrix();
   translate(width/2, height/2);
   PVector centre = new PVector(0, 0);
   fill(0);
   ellipse(centre.x, centre.y, 5, 5);
   noFill();
   ellipse(centre.x, centre.y, 2*r, 2*r);
   line(r*cos(theta), r*sin(theta), -r*cos(theta), -r*sin(theta));
   popMatrix();
   
   theta += 0.01;
   
   
 }
