class Neighbourhood {

  Cell[][] n;

  int epiX, epiY;

  Neighbourhood(int epiX_, int epiY_) {
    n = new Cell[s][s];
    epiX = epiX_;
    epiY = epiY_;
    init();
    n[epiX][epiY].mark();
  }

  void init() {
    for (int x = 0; x < s; x ++) {
      for (int y = 0; y < s; y ++) {
        n[x][y] = new Cell(new PVector(x, y));
      }
    }
  }

  void show() {
    for (int x = 0; x < s; x ++) {
      for (int y = 0; y < s; y ++) {
        n[x][y].show();
      }
    }
  }

  void findKthNeighbourhood() {   
    ArrayList<PVector> prevArray = new ArrayList<PVector>();
    prevArray.add(new PVector(epiX, epiY));

    for (int kth = 0; kth < k; kth ++) {
      ArrayList<PVector> kthArray = new ArrayList<PVector>();
      
      // on this pass of the thing
      boolean[][] checkMatrix = new boolean[s][s];
      for(int x = 0; x < s; x++){
        for(int y = 0; y < s; y++){
          checkMatrix[x][y] = false;
        }
      }
      
      for (int i = 0; i < prevArray.size(); i++) {
        int xcoord = int(prevArray.get(i).x);
        int ycoord = int(prevArray.get(i).y);
        for (int offset = -1; offset < 2; offset += 2) {
          int newX = xcoord + offset;
          int newY = ycoord + offset;

          // if the new X coordinate is inside the boar array AND we haven't already visited it...
          if (newX >= 0 && newX <= s && !checkMatrix[newX][ycoord]) {
            //Add the new x coordinates and mark them;
            PVector newLoc = new PVector(newX, ycoord);

            kthArray.add(newLoc);
            n[newX][ycoord].mark();
            checkMatrix[newX][ycoord] = true;
            
          }

          if (newY >= 0 && newY <= s && !checkMatrix[xcoord][newY]) {
            //Add the new y coordinates and mark them
            kthArray.add(new PVector(xcoord, newY));
            n[xcoord][newY].mark();
            checkMatrix[newX][ycoord] = true;
          }
        }
      }
      // store this in the previous array
      prevArray = kthArray;
    }
  }
}
