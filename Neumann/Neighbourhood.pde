class Neighbourhood {
  Cell[][] n;
  ArrayList<Integer> sickX, sickY;

  Neighbourhood(int epi_X, int epi_Y) {
    sickX = new ArrayList<Integer>();
    sickY = new ArrayList<Integer>();
    sickX.add(epi_X);
    sickY.add(epi_Y);
    n = new Cell[s][s];
    for (int x = 0; x < s; x++) {
      for (int y = 0; y < s; y++) {
        n[x][y] = new Cell(x, y);
      }
    }
    n[sickX.get(0)][sickY.get(0)].mark();
  }

  void show() {
    for (int x = 0; x < s; x++) {
      for (int y = 0; y < s; y++) {
        n[x][y].show();
      }
    }
  }

  void updateCell(int x, int y) {
    n[x][y].mark();
  }

  void findKthNeighbourhood() {
    for (int iteration = 0; iteration < k; iteration++) {
      print("k = " + k);
      for (int j = 0; j < sickX.size(); j++) {
        findNeighbours(sickX.get(j), sickY.get(j));
      }
    }
  }

  void findNeighbours(int x, int y) {
    for (int offset = -1; offset < 2; offset++) {
      int xcoord = x + offset;
      int ycoord = y + offset;
      if (xcoord >= 0 && xcoord <= s && ycoord >= 0 && ycoord <= s) {
        n[xcoord][y].mark();
        sickX.add(xcoord);
        n[x][ycoord].mark();
        sickY.add(ycoord);
      }
    }
  }
}
