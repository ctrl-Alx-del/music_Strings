class Notation {


  int x, y, x2, y2;
  

  Notation(int tempX, int tempY, int tempX2, int tempY2) {
    x = tempX;
    y = tempY;
    x2 = tempX2;
    y2 = tempY2;
  }


  void display() {
    for (int i = 1; i <= 5; i++) {
      stroke(255);
      strokeWeight(4);
      //sheets horizontal lines
      line(x, y*i, x2, y*i);
    }
    //sheets vertical lines
    line(x2, y, x2, y2);
    line(x, y, x, y2);
  }


  void notes() {
    noFill();
    strokeWeight(5);
    stroke(255);
    for (int i = 50; i <= 500; i = i + 80) {
      //If high note multiply y with something
      ellipse(x+i, 50*1.5, 40/2, 30/2);
    }
  }
}
