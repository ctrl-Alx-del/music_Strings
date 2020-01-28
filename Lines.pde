class SoundLine {

  float x, y1, y2; //coordinates of the musicStrings/lines
  float speed; //Rate of how quick the animation of the lines going upwards is
  int limit; //Limit where the lines should stop
  int thickness; //Thickness of the lines
  int sound;
  int text; //The text from noteLetters is tied which each line through the for-loop on line 108 main program.
  int textX; //text placement
  int textY;
  color c; //Color of the line
  int noteFollow; //Used to make each string have its individual boolean with the for-loop on line 108 main program
  boolean reset; //Used to make the sound only play once
  int textSize;

  //Constructor for the lines
  SoundLine(int tempX, int tempY1, int tempY2, int tempThickness, int tempSound, int tempText, int tempNoteFollow) {
    x = tempX;
    y1 = tempY1;
    y2 = tempY2;
    speed = 4;
    thickness = tempThickness;
    sound = tempSound;
    text = tempText;
    textY = 235;
    textX = 35;
    noteFollow = tempNoteFollow;
    reset = true;
    textSize = 80;
    c = 255;
  }


  void display() {
    stroke(c);
    strokeWeight(thickness);
    //The musicStrings/lines 
    line(x, y1, x, y2);
  }

  void stretch(int limit) {
    //When the stretch is called. The limit is set for each as a parameter.
    y2 = y2 - speed; 
    if (y2 <= limit) { 
      speed = 0;
    }
  }



  void hitBox (int alignX, int alignY) {
    if ( mouseY > y2 && mouseY < y1 && mouseX >= x-thickness/2 && mouseX <= x+thickness/2) {
      textSize(textSize);
      text(notesLetters[text + pitch], textX+alignX, textY+alignY); //The noteLetters array is used to display characters above each line played. AlignX and AlignY recieves arguments that make them follow each line down.
      noteChecker[noteFollow + pitch] = true; //noteChecker is set to true if a note is hit. Pitch is used to go to the next set of booleans that are tied to the next set of lines     
      c = #FEFF05; //Color yellow if you hit the line. In hexadecimal Red is (F = 240 + E = 14) = 254, Green is (F = 240 + F = 15) = 255, Blue is (0 + 5) = 5.
     
      if (reset) {      
        guitarSounds[sound + pitch].play(); //The sounds are tied to each line through for-loop in the main program line 108. So fx. musicString[0] has sound = 0, which is therefore 7.wav.
        reset = false; //reset makes the sound only play once. Sound only plays while both reset and the above if-statement on line 53 is true.
      }
    } else {
      reset = true;
      c = 255; //set to white if the hitbox is not hit
      noteChecker[noteFollow + pitch] = false; //noteChecker is set to false when you do not hit a lines hitbox
    }
  }
}
