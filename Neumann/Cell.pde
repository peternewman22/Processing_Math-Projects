class Cell{
  int x, y;
  boolean isMarked;
  
  Cell(int x_, int y_){
    x = x_;
    y = y_;
    isMarked = false;
  }
  
  void show(){
    int fillCol = isMarked ? 100 : 255;
    fill(fillCol);
    rect(x*w, y*w, w, w);
  }
  
  void mark(){
    isMarked = true;
  }
  
}
