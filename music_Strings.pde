import processing.sound.*;

//sounds
SoundFile guitarSounds [] = new SoundFile [14];
SoundLine musicString [] = new SoundLine [7];

//Buttons
Button pitchButton;

int lowerPos = 700;
int upperPos = 200; // The maximum length a line can get to
int middlePos = upperPos-lowerPos;
int tilt = 50; // Controls how much each line should be lower than the other


void setup() {
  size(800, 800);

  int _x = 50;
  //spacing = 100 gives a spacing that fits the window. Can be changed for bigger windows
  int spacing = 100;

  pitchButton = new Button(50, 50, 50, 50);

  //Sounds get loaded
  guitarSounds[0] = new SoundFile(this, "7.wav");
  guitarSounds[1] = new SoundFile(this, "6.wav");
  guitarSounds[2] = new SoundFile(this, "5.wav");
  guitarSounds[3] = new SoundFile(this, "4.wav");
  guitarSounds[4] = new SoundFile(this, "3.wav");
  guitarSounds[5] = new SoundFile(this, "2.wav");
  guitarSounds[6] = new SoundFile(this, "1.wav");
  
  //Deeper sounds (implement later)
  guitarSounds[7] = new SoundFile(this, "7 - Kopi.wav"); 
  guitarSounds[8] = new SoundFile(this, "6 - Kopi.wav");
  guitarSounds[9] = new SoundFile(this, "5 - Kopi.wav");
  guitarSounds[10] = new SoundFile(this, "4 - Kopi.wav");
  guitarSounds[11] = new SoundFile(this, "3 - Kopi.wav");
  guitarSounds[12] = new SoundFile(this, "2 - Kopi.wav");
  guitarSounds[13] = new SoundFile(this, "1 - Kopi.wav");

  //Make lines that you can play sounds on. Each line is separated with the int spacing.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i] = new SoundLine(_x+(i*spacing), lowerPos, 600, 10, i);
  }
}


void draw() {
  background(0);
  //First musicString in the array is the one most left and so on
  for (int i = 0; i <= musicString.length-1; i++) { 
    musicString[i].display();
  }


  //Makes the strings go upwards in the beginning. Animation.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i].stretch(upperPos+(i*tilt));
  }

  //Hitbox for the strings
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i].hitBox();
  }
  
  //Pitcher button
  pitchButton.display();
  pitchButton.mouseOver();
  pitchButton.pitchUp();

}
