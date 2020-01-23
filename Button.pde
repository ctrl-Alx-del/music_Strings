class Button {

  int x, y, w, h;
  boolean oneClick; //Used so you can only click once and will not click if you hold the mouse button down
  boolean outOfUpperBounds; //OutOfBounds booleans makes sure that the array does not go out of bounds and crashes the program
  boolean outOfLowerBounds;
  boolean buttonClicked; //Checks if the button is clicked. Used line 80-83 and 96-99 so the pitch buttons only increase pitch and level once.
  String direction; //Used to check which image should be displayed line 40-44
  color boxColor; //Button color
  int textX, textY; //Text placement
  int clefXAdjust, clefYAdjust; //Adjustment to the clefs so they stay besides the music sheet

  //Constructor for the buttons
  Button(int tempX, int tempY, int tempW, int tempH, String tempDirection) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    oneClick = true;
    outOfUpperBounds = true;
    outOfLowerBounds = true;
    buttonClicked = false;
    direction = tempDirection;
    boxColor = 150;
    textX = 50;
    textY = 35;
    clefXAdjust = -100;
    clefYAdjust = 100;
  }

  void display() {
    fill(boxColor);
    stroke(boxColor);
    //The rectangle for the buttons
    rect(x, y, w, h);
    //Shows the corresponding image if the button has a string called "up" or "down". Else the images would get shown on both buttons when the function is called on each object.
    if ( direction == "up") {
      image(arrowUp, x, y);
    }
    if ( direction == "down") {
      image(arrowDown, x, y);
    }

    //Text is displayed
    fill(0);
    textSize(30);
    text("Pitch level " + level, textX, textY);

    //Images 
    //The clef changes depending on the level of pitch. If level is above 2 it changes to a g-clef, else it is a f-clef
    if ( level > 2) {    
      image(gclef, sheetX+clefXAdjust+xPosSheet, sheetY+clefYAdjust+yPosSheet);
    } else {
      image(fclef, sheetX+clefXAdjust+xPosSheet, sheetY+clefYAdjust+yPosSheet);
    }
  }


  void mouseOver() {
    //Hitbox for the buttons. oneClick controls that you can not hold in mousePressed.
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && oneClick) {
      oneClick = false; 
      buttonClicked = true;
    }

    //Hitbox for the button. Switches color when you click goes back to original color afterwards. You can not switch color if it is out of bounds
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && outOfUpperBounds && outOfLowerBounds) {
      boxColor = 150;
    } else {
      boxColor = #FFEB05;
    }

    //If the bellow statements are not true then set oneClick to true again. That is when mouse is outside of the button boundaries.
    if (!(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)) { 
      oneClick = true;
    }
  }

  void pitchUp() {
    //buttonClicked set to false so pitch does not increase indefinetly and makes guitarSounds go out of bounds
    if (buttonClicked && outOfUpperBounds) {
      pitch += musicString.length;  //pitch gets increased with 7.
      buttonClicked = false;
      level++;
    }
    //If pitch is above the upperlimit it will activate outOFUpperBounds so you can not increase the pitch anymore. Same goes for line 101-104, just with outOfLowerBounds instead.
    if (upperLimit < pitch) {
      outOfUpperBounds = false;
    } else {
      outOfUpperBounds = true;
    }
  }


  void pitchDown() {
    if (buttonClicked && outOfLowerBounds) { 
      pitch -= musicString.length; //Pitch gets decreased with 7.
      buttonClicked = false;
      level--;
    }
    if (pitch < musicString.length) {
      outOfLowerBounds = false;
    } else {
      outOfLowerBounds = true;
    }
  }
}
