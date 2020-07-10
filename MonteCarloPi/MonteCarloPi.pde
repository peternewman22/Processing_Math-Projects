ArrayList<PVector> points;
PVector centre;
int pointsInsideCircle, pointsOutsideCircle;

void setup(){
    size(720, 720);
    centre = new PVector(width/2, height/2);
    points = new ArrayList<PVector>();
    pointsInsideCircle = 0;
    pointsOutsideCircle = 0;
    textSize(10);
    textAlign(CENTER);
}

void draw(){
    if(points.size() > 10000){
        noLoop();
    }
    background(0);
    noStroke();
    fill(255);
    ellipse(width/2, height/2, 720, 720);
    PVector p = new PVector(random(width),random(height));
    classify(p);
    stroke(255, 0, 0);
    strokeWeight(2);
    points.add(p);
    for(PVector point : points){
        point(point.x, point.y);
    }
    
    fill(0);
    float percentage = 4*pointsInsideCircle/(pointsInsideCircle+pointsOutsideCircle);
    // String s = ("Points inside circle: %i, Points outside circle: %i, Percentage Outside: %f" % (pointsInsideCircle, pointsOutsideCircle, percentage));
    // String s = ("Points inside circle: %i" % (pointsInsideCircle));
    // s = ("This %s is %i years old, and weighs %.1f pounds." % ("Turtle", 3, 10.5))
    // text(str(pointsInsideCircle), width/2, height/2);
    text(str(pointsInsideCircle),width/2, height/2);
    text(str(pointsOutsideCircle), width/2, height/2+10);
    text(nf(percentage,0,5), width/2, height/2+20);
}

void classify(PVector p){
    if(p.dist(centre) > 360){
        pointsOutsideCircle ++;
    } else {
        pointsInsideCircle ++;
    }
}