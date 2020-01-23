class Notation {

  int x, y, x2, y2; //Coordinates of both the music sheet and
  int h, w; //Height and width of the notes
  color stroke; //Color of the notes

  //Constructor for the sheet
  Notation(int tempX, int tempY, int tempX2, int tempY2) {
    x = tempX;
    y = tempY;
    x2 = tempX2;
    y2 = tempY2;
  }

  //Constructor for notes. They can not have the same amount of parameters with the same datatype! tempStroke added.
  Notation(int tempX, int tempY, int tempH, int tempW, color tempStroke) {
    x = tempX;
    y = tempY;
    h = tempH;
    w = tempW;
    stroke = tempStroke;
  }

  //adjustY used to make everything move together on the y-axis, same goes for adjustX.
  void display(int adjustY, int adjustX) {
    stroke(stroke);
    strokeWeight(4);

    for (int i = 1; i <= 5; i++) {
      //Music sheets horizontal lines
      line(x+adjustX, adjustY+y*i, x2+adjustX, adjustY+y*i);
    }

    //Music sheets vertical lines
    line(x2+adjustX, adjustY+y, x2+adjustX, adjustY+y2);
    line(x+adjustX, adjustY+y, x+adjustX, adjustY+y2);
  }


  void notes(int adjustY, int adjustX) {
    noFill();
    strokeWeight(5);
    stroke(0);
    //The notes
    ellipse(x+adjustX, adjustY+y, h, w);
  }
}
