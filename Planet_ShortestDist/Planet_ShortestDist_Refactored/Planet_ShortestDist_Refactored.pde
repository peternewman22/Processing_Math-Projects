float sunR, r, orbitR, t, rate;
Planet mercury, venus, earth, mars;
Planet[] planets;
Column[] columns;
boolean endOfAnimation;

void setup() {
  size(1500, 1000, P2D);
  sunR = 100;
  r = 50;
  t=0;
  rate = 0.01;
  
  endOfAnimation = false;
  
  orbitR = 300;
  planets = new Planet[4]; //planet array
  planets[0] = new Planet(0.383*r, orbitR*0.387, 1/0.241, color(0xFFa9a9a9)); //mercury 
  planets[1] = new Planet(0.95*r, orbitR*0.7, 1/0.615, color(0xFFc8a2c8)); //venus
  planets[2] = new Planet(r, orbitR, 1, color(0xFF003366)); //earth
  planets[3] = new Planet(0.5*r, orbitR*1.5, 1/1.8, color(0xFF934838)); //mars
  
  columns = new Column[4];
  columns[0] = new Column(0, color(0xFFa9a9a9), "mercury"); //mercury
  columns[1] = new Column(100, color(0xFFc8a2c8), "venus"); //venus
  columns[2] = new Column(300, color(0xFF003366), "earth"); //earth
  columns[3] = new Column(200, color(0xFF934838), "mars"); //mars
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/3, height/2);

  //draw the sun
  fill(0xFFf9d71c);
  noStroke();
  ellipse(0, 0, sunR, sunR);

  for (Planet p : planets) {
    p.update(t);
    p.render();
  }
  int closestPlanetIndex = findClosestPlanet();
  drawMinDistance(closestPlanetIndex);
  columns[closestPlanetIndex].updateY();
  popMatrix();

  pushMatrix();
  translate(1000, 2*height/3);
  for(Column col : columns){
    col.render();
    if(col.callReset()){
      reset();
    }
  }
  popMatrix();
  t += rate;
}

int findClosestPlanet() {
  PVector earthLoc = planets[2].getLoc();
  float minDist = 10000;
  int closestPlanetIndex = 2;

  for (int i = 0; i < planets.length; i++) {
    if (i==2) {
      continue;
    } else {
      float dist2E = earthLoc.dist(planets[i].getLoc());
      if (dist2E < minDist) {
        minDist = dist2E;
        closestPlanetIndex = i; //reassign closetPlanetIndex
      } else {
        continue;
      }
    }
  }
  return closestPlanetIndex;
}

void drawMinDistance(int closestPlanetIndex) {
  PVector earthLoc = planets[2].getLoc();
  stroke(255);
  PVector target = planets[closestPlanetIndex].getLoc(); 
  line(earthLoc.x, earthLoc.y, target.x, target.y);
}

void reset(){
  t = 0;
  for(Column col : columns){
    col.resetValues();
  }
}
