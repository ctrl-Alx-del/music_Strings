class Notation {


  int x, y, x2, y2;
  int h, w;
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
    stroke = tempStroke;
  }

  //adjustY used to make everything move together on the y-axis
  void display(int adjustY, int adjustX) {
    for (int i = 1; i <= 5; i++) {
      stroke(0);
      strokeWeight(4);

      //sheets horizontal lines
      line(x+adjustX, adjustY+y*i, x2+adjustX, adjustY+y*i);
    }
    //sheets vertical lines
    line(x2+adjustX, adjustY+y, x2+adjustX, adjustY+y2);
    line(x+adjustX, adjustY+y, x+adjustX, adjustY+y2);
  }


  void notes(int adjustY, int adjustX) {
    noFill();
    strokeWeight(5);
    stroke(0);
    /*for (int i = 1; i <= musicString.length-1; i++) {
      noteX[i] = sheetX+50*i;
    }*/


    for (int i = 0; i <= addNote; i++) {
      //If high note multiply y with something
      ellipse(x, adjustY+y, h, w);
    }
    println(noteX);
  }
}
