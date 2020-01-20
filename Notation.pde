class Notation {


  int x, y, x2, y2;
  int h, w;
  int addNote;
  color stroke;


  //Constructor for the sheet
  Notation(int tempX, int tempY, int tempX2, int tempY2) {
    x = tempX;
    y = tempY;
    x2 = tempX2;
    y2 = tempY2;
  }

  //Constructor for notes. Add another parameter than tempC. They can not have the same amount of parameters with the same datatype
  Notation(int tempX, int tempY, int tempH, int tempW, color tempStroke) {
    x = tempX;
    y = tempY;
    h = tempH;
    w = tempW;
    addNote = 0;
    stroke = tempStroke;
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


  void notes(int a) {
    noFill();
    strokeWeight(5);
    stroke(stroke);
    //for (int i = 50; i <= 500; i = i + 80) {
      //If high note multiply y with something
      ellipse(x+a/*i*/, y*a, h, w);
    //}
  }

  void noteChecker() {
    for (int i = 0; i <= noteChecker.length-1; i++) {
      if (noteChecker[i] == true) {
        addNote++;
          println(addNote);
      }
    }
  }
}
