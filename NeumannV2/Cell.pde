class Cell {
  boolean isMarked;
  PVector loc;

  Cell(PVector loc_) {
    loc = loc_.copy();
    isMarked = false;
  }

  void show() {
    if (isMarked) {
      fill(100);
    } else {
      fill(255);
    }

    rect(loc.x*w, loc.y*w, w, w);
  }
  
  
  void mark(){
    isMarked = true;
  }
  
}
