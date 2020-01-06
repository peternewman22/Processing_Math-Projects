class Light {
  //constructor
  PVector loc;
  float angle, RayNum;
  Ray[] rays;


  Light(PVector loc_, float angle_) {
    loc = loc_.copy();
    angle = angle_;
    RayNum = TWO_PI/angle;

    //store rays in array
    for (int i = 0; i<RayNum; i++) {
      rays[i] = new Ray(loc, i*angle);
    }
  }

  void show() {
    for( Ray ray : rays){
      ray.show(100);
    }
  }
}
