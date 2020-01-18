class SoundLine {

  float x, y1, y2;
  float speed;
  int limit;
  int thickness;
  boolean reset;
  int sound;
  int text;
  int textX;
  int textY;



  SoundLine(int tempX, int tempY1, int tempY2, int tempThickness, int tempSound, int tempText) {
    x = tempX;
    y1 = tempY1;
    y2 = tempY2;
    speed = 4;
    thickness = tempThickness;
    reset = true;
    sound = tempSound;
    text = tempText;
    textY = 180;
    textX = 35;
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
      textSize(100);
      text(notesLetters[text + pitch], textX+alignX, textY+alignY);

      if (reset) {
        //The sound is tied to each line through the constructor. So fx. musicString[0] has sound = 0, which is therefore 7.wav.
        guitarSounds[sound + pitch].play();
        reset = false;
      }
    } else {
      reset = true;
    }
  }
}
