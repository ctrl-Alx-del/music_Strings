class soundLine {

  float x1, y1, x2, y2;
  float speed;
  int limit;
  int spacing;

  soundLine(int tempX1, int tempY1, int tempX2, int tempY2) {
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    speed = 4;
    limit = 50;
    spacing = 100;
  }


  void display() {

    stroke(255);
    strokeWeight(3);
    //The strings 
    for (float i = 100; i <= 700; i = i + spacing) {
      //6 is the amount of strings
      for (int j = 1; j <= 7; j++) {
        line(i, y1, i, y2/j);
        println(y2/j);
      }
    }
  }

  void stretch() {
    y2 = y2 - speed;
    for (int j = 1; j <= 6; j++) {
      if (y2 < limit/j) {
        speed = 0;
      }
    }
  }
}
