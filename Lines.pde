class SoundLine {

  float x, y1, y2;
  float speed;
  int limit;
  int thickness;
  boolean reset;
  int sound;




  SoundLine(int tempX, int tempY1, int tempY2, int tempThickness, int tempSound) {
    x = tempX;
    y1 = tempY1;
    y2 = tempY2;
    speed = 4;
    thickness = tempThickness;
    reset = true;
    sound = tempSound;
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



  void hitBox () {
    //Only plays sound once while you are inside the line otherwise it doesn't repeat it
    if ( mouseY > y2 && mouseY < y1 && mouseX >= x-thickness/2 && mouseX <= x+thickness/2) {    
      if (reset) {
        //The sound is tied to each line through the constructor. So fx. musicString[0] has sound = 0, which is therefore 7.wav.
        guitarSounds[sound].play();
        reset = false;
        println(reset);
      }
    } else {
      reset = true;
    }
  }
}
