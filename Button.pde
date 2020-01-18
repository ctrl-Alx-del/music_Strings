class Button {

  int x, y, w, h;
  boolean oneClick;
  //OutOfBounds booleans makes sure that the array does not go out of bounds and crashes the program
  boolean outOfUpperBounds;
  boolean outOfLowerBounds;
  boolean buttonClicked;
  int buttonX;
  int buttonY;
  String direction;
  color boxColor;


  Button(int tempX, int tempY, int tempW, int tempH, int tempButtonX, int tempButtonY, String tempDirection) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    oneClick = true;
    outOfUpperBounds = true;
    outOfLowerBounds = true;
    buttonClicked = false;
    buttonX = tempButtonX;
    buttonY = tempButtonY;
    direction = tempDirection;
    boxColor = 255;
  }

  void display() {
    //arrow image downloaded from: https://www.pngfuel.com/free-png/ofonr
    fill(boxColor);
    stroke(boxColor);
    rect(x, y, w, h);
    if ( direction == "up") {
      image(arrowUp, buttonX, buttonY);
    }
    if ( direction == "down") {
      image(arrowDown, buttonX, buttonY);
    }
    
    //Text is displayed
    fill(255);
    textSize(30);
    text("Chord " + chords[level-1], 500, 50);
    text("Pitch level " + level, 50, 50);
  }

  //Change to levelText() if chords are not needed.
  void chordText() {
  }

  void mouseOver() {
    //hitbox for the box. oneClick controls that you can not hold in mousePressed.
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && oneClick) {
      oneClick = false; 
      buttonClicked = true;
    }

    //hitbox for the box. Switches color when you click goes back to original color afterwards. You can not switch color if it is out of bounds
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && outOfUpperBounds && outOfLowerBounds) {
      boxColor = 150;
    } else {
      boxColor = 255;
    }

    //if the bellow statements are not true the set oneClick to true again. That is when mouse is outside of the box.
    if (!(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)) { 
      oneClick = true;
    }
  }

  void pitchUp() {
    //buttonClicked set to false so pitch does not increase and makes guitarSounds go out of bound
    if (buttonClicked && outOfUpperBounds) {
      //Pitch gets increased with 7.
      pitch += musicString.length;
      buttonClicked = false;
      println("pitchUp " + pitch);
      level++;
    }
    if (upperLimit < pitch) {
      outOfUpperBounds = false;
    } else {
      outOfUpperBounds = true;
    }
  }


  void pitchDown() {
    if (buttonClicked && outOfLowerBounds) {
      //Pitch gets decreased with 7.
      pitch -= musicString.length;
      buttonClicked = false;
      println("pitchDown " + pitch);
      level--;
    }
    if (pitch < musicString.length) {
      outOfLowerBounds = false;
    } else {
      outOfLowerBounds = true;
    }
  }
}
