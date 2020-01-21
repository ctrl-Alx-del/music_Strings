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

  //adjustY used to make everything move together on the y-axis
  void display(int adjustY) {
    for (int i = 1; i <= 5; i++) {
      stroke(255);
      strokeWeight(4);
      //sheets horizontal lines
      line(x, adjustY+y*i, x2, adjustY+y*i);
    }
    //sheets vertical lines
    line(x2, adjustY+y, x2, adjustY+y2);
    line(x, adjustY+y, x, adjustY+y2);
  }


  void notes(int adjustY) {
    noFill();
    strokeWeight(5);
    stroke(stroke);
    for (int i = 0; i <= addNote; i++) {
      //If high note multiply y with something
      ellipse(x+i*25, adjustY+y, h, w);
    }
  }
}
