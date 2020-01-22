class SoundLine {

  float x, y1, y2;
  float speed;
  int limit;
  int thickness;
  int sound;
  int text;
  int textX;
  int textY;
  
  //Used to make each string have its individual boolean turn on
  int noteFollow;
  boolean reset;
  int textSize;


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
  }


  void display() {
    stroke(255);
    strokeWeight(thickness);
    //The strings 
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
    //Only plays sound once while you are inside the line otherwise it doesn't repeat it
    if ( mouseY > y2 && mouseY < y1 && mouseX >= x-thickness/2 && mouseX <= x+thickness/2) {
      textSize(textSize);
      text(notesLetters[text + pitch], textX+alignX, textY+alignY);
      noteChecker[noteFollow + pitch] = true;

      if (reset) {
        //The sound is tied to each line through the constructor. So fx. musicString[0] has sound = 0, which is therefore 7.wav.
        guitarSounds[sound + pitch].play();
        reset = false;
        // Adds a note to the music sheet. Uses modulo, resets number to 0 when addNote reaches 8.
        addNote = (addNote + 1) % 8;
      }
    } else {
      reset = true;
    }
  }
}
