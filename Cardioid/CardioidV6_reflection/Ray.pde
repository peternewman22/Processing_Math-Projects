class Ray{

   PVector loc;
   float a;
  
  Ray(PVector loc_, float angle){
    loc = loc_.copy();
    a = angle;
    
  
  }
  
  void show(float extent){
    //make a PVector at a certain angle
    PVector dir = PVector.fromAngle(a);
    line(loc.x, loc.y, extent*dir.x,extent* dir.y);
    
  }
}
