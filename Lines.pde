class SoundLine {

  float x1, y1, x2, y2;
  float speed;
  int limit;
  int spacing;
  int amountStrings;

  SoundLine(int tempX1, int tempY1, int tempX2, int tempY2, int tempLimit) {
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    speed = 4;
    limit = tempLimit;
    spacing = 100;
    amountStrings = 700;
  }


  void display() {
    stroke(255);
    strokeWeight(3);
    //The strings 
    for (float i = spacing; i <= amountStrings; i = i + spacing) {
      //7 is the amount of strings
      line(i, y1, i, y2);
       
    }
  }

  void stretch(int limit) {
    y2 = y2 - speed; 
    if (y2 <= limit) { 
      speed = 0;
    }
  }
}
