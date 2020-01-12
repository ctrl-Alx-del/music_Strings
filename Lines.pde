class SoundLine {

  float x, y1, y2;
  float speed;
  int limit;
  int spacing;
  int amountStrings;
  int thickness;



  SoundLine(int tempX, int tempY1, int tempY2, int tempThickness) {
    x = tempX;
    y1 = tempY1;
    y2 = tempY2;
    speed = 4;
    spacing = 100;
    amountStrings = 700;
    thickness = tempThickness;
  }


  void display() {
    stroke(255);
    strokeWeight(thickness);
    //The strings 
    //7 is the amount of strings
    line(x, y1, x, y2);
  }

  void stretch(int limit) {
    y2 = y2 - speed; 
    if (y2 <= limit) { 
      speed = 0;
    }
  }

  void hitBox () {
    if ( mouseY > y2 && mouseY < y1 && mouseX >= x-thickness/2 && mouseX <= x+thickness/2) {
      fill(0, 255, 0);
      ellipse(50, 50, 50, 50);
    }
  }
}
