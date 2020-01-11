class SoundLine {

  float x1, y1, x2, y2;
  float speed;
  int limit;
  int spacing;
  int amountStrings;



  SoundLine(int tempX1, int tempY1, int tempX2, int tempY2) {
    x1 = tempX1;
    y1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
    speed = 4;
    spacing = 100;
    amountStrings = 700;
  }


  void display() {
    stroke(255);
    strokeWeight(3);
    //The strings 
    //7 is the amount of strings
    line(x1, y1, x2, y2);
  }

  void stretch(int limit) {
    y2 = y2 - speed; 
    if (y2 <= limit) { 
      speed = 0;
    }
  }

  void hitBox (int adjuster) {
    rectMode(CENTER);

    // (y1+y2)/2 gives the middle of the line
    float boxY = (y1+y2)/2;
    int widthBox = 3;

    int heightBox = upperPos-lowerPos+adjuster;
    //upperPos-lowerPos = 200, the adjuster makes each hitbox larger for every musicString

    int c = 255;
    fill(c);
    rect(x1, boxY, widthBox, heightBox);


    if ( mouseY > boxY-heightBox && mouseY < boxY+heightBox && mouseX > boxY-widthBox && mouseX < boxY+widthBox ) {
     fill(0, 255, 0);
     ellipse(50, 50, 50, 50);
     } else {
     fill(255, 0, 0);
     rect(50, 50, 50, 50);
     }
  }
}
