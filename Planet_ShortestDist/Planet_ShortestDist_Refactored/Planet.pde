class Planet{
  float radius;
  float orbitRadius;
  //float perihelion;
  //float aphelion;
  float orbitalSpeed;
  color colour;
  float angle;
  
  Planet(float _radius, float _orbitRadius, float _orbitalSpeed, color _colour){
    radius = _radius;
    orbitRadius = _orbitRadius;
    orbitalSpeed = _orbitalSpeed;
    colour = _colour;
    angle = 0;
  }
  
  PVector getLoc(){
    return new PVector(orbitRadius*cos(orbitalSpeed*angle), orbitRadius*sin(orbitalSpeed*angle));
  }
  
  void update(float newAngle){
    angle = newAngle;
  }
  
  void render(){
    //draw orbit path
    stroke(255,255,255,50);
    noFill();
    ellipse(0,0,2*orbitRadius,2*orbitRadius);
    fill(colour);
    noStroke();
    ellipse(getLoc().x, getLoc().y, radius, radius);
    
  }
  
}
