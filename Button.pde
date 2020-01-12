class Button {

  int x, y, w, h;
  boolean oneClick;
  boolean outOfUpperBounds;
  boolean outOfLowerBounds;
  boolean buttonClicked;

  Button(int tempX, int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    oneClick = true;
    outOfLowerBounds = false;
    outOfLowerBounds = false;
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
    if (buttonClicked) {
      println(buttonClicked);
      for (int i = 0; i <= musicString.length-1; i++) {
        guitarSounds[i] = guitarSounds[i+7]; 
      }
    }
  }
}
