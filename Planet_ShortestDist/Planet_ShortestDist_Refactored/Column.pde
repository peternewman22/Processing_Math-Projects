/* 
 Location relative to the start of the thing
 updatable y coord mapped to the limits of the thing
 */

class Column {
  float xOffset;
  float colWidth;
  float y;
  color colour;
  String label;
  Column(float xStart, color Colour, String s) {
    xOffset = xStart;
    colWidth = 50;
    colour = Colour;
    y = 0;
    label = s;
  }

  void updateY() {
    y+=0.2;
  }

  void render() {
    fill(colour);
    noStroke();
    rect(xOffset, 0, colWidth, -y);
    textAlign(CENTER);
    text(label, xOffset+colWidth/2, 20);
  }
  
  boolean callReset(){
    if(y > 500){
      return true;
    } else {
      return false;
    }
  }
  
  void resetValues(){
    y = 0;
  }
}
