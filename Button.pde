class Button {

  int x, y, w, h;
  boolean oneClick;
  //OutOfBounds booleans makes sure that the array does not go out of bounds and crashes the program
  boolean outOfUpperBounds;
  boolean outOfLowerBounds;

  boolean buttonClicked;

  Button(int tempX, int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    oneClick = true;
    outOfUpperBounds = true;
    outOfLowerBounds = true;
    buttonClicked = false;
  }

  void display() {
    rect(x, y, w, h);
  }

  void mouseOver() {
    //hitbox for the box. oneClick controls that you can not hold in mousePressed.
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && oneClick) {
      oneClick = false; 
      buttonClicked = true;
    }

    //if the bellow statements are not true the set oneClick to true again. That is when mouse is outside of the box.
    if (!(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)) { 
      oneClick = true;
    }
  }

  void pitchUp() {
    if (buttonClicked && outOfUpperBounds) {
      //buttonClicked set to false so pitch does not increase and makes guitarSounds go out of bound
      pitch += 7;
      buttonClicked = false;
      println("pitchUp " + pitch);
    }
    if (13 < pitch) {
      outOfUpperBounds = false;
    } else {
      outOfUpperBounds = true;
    }
  }


  void pitchDown() {
    if (buttonClicked && outOfLowerBounds) {
      pitch -= 7;
      buttonClicked = false;
      println("pitchDown " + pitch);
    }
    if (pitch < 1) {
      outOfLowerBounds = false;
    } else {
      outOfLowerBounds = true;
    }
  }
}
