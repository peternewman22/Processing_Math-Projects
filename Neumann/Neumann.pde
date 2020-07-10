int s, k;
float w;
Neighbourhood nhood;

void setup(){
  size(1000, 1000);
  s = 9;
  k = 2;
  w = width/s;
  nhood = new Neighbourhood(4,4);
  nhood.findKthNeighbourhood();
  
  
}

void draw(){
  background(0);
  
  nhood.show();
 
  
  // when k = 1
  
  
}



//void findNeighbours(PVector loc){
//  for
//}
