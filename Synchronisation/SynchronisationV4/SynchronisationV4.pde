Wave[] waves;
int t;

void setup() {
  size(1080, 720);
  waves = new Wave[3];
  waves[0] = new Wave(0, color(255, 0, 0));
  waves[1] = new Wave(PI/3, color(0, 255, 0));
  waves[2] = new Wave(2*PI/3, color(0, 0, 255));
  strokeWeight(5); 
  t = 0;
  noFill();
}

void draw() {
  background(0);
  for (Wave w : waves) {
    w.update(waves, t);
    w.render();
  }
  t ++;
}
