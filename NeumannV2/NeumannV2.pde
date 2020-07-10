int s, k;
float w;
Neighbourhood neighbourhood;

void setup(){
  size(1000, 1000);
  s = 25;
  w = width/s;
  k = 1;
  neighbourhood = new Neighbourhood(13, 4);
  textAlign(CENTER);
  textSize(32);
}

void draw(){
  background(0);
  
  
  neighbourhood.findKthNeighbourhood();
  neighbourhood.show();
  fill(0);
  String currentK = "k = " + k;
  text(currentK, 100, 100);
  if(frameCount%100 == 0){
    k ++;
  }
}
