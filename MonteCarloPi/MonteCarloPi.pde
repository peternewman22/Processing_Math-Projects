ArrayList<PVector> points;
PVector centre;

void setup(){
    size(720, 720);
    centre = new PVector(width/2, height/2);
    points = new ArrayList<PVector>();
    fill(255);
}

void draw(){
    background(0);
    
    ellipse(width/2, height/2, 720, 720);

}