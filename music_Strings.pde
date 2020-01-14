import processing.sound.*;


//sounds
SoundFile guitarSounds [] = new SoundFile [21];
SoundLine musicString [] = new SoundLine [7];
String [] notes = new String [guitarSounds.length];

//Buttons
Button pitchUpButton;
Button pitchDownButton;

//musicStrings variables
int lowerPos = 700;
int upperPos = 200; // The maximum length a line can get to
int middlePos = upperPos-lowerPos;
int tilt = 50; // Controls how much each line should be lower than the other
int pitch; //Variable to switch the guitarSounds array to the deeper sounds



void setup() {
  size(800, 800);
  //x coordinate for the first musicString
  int _x = 50; 
  //spacing = 100 gives a spacing that fits the window. Can be changed for bigger windows
  int spacing = 100;

  pitchUpButton = new Button(50, 50, 50, 50);
  pitchDownButton = new Button(150, 50, 50, 50);

  //Lower Sounds
  guitarSounds[0] = new SoundFile(this, "1.wav");
  guitarSounds[1] = new SoundFile(this, "1.wav");
  guitarSounds[2] = new SoundFile(this, "1.wav");
  guitarSounds[3] = new SoundFile(this, "1.wav");
  guitarSounds[4] = new SoundFile(this, "1.wav");
  guitarSounds[5] = new SoundFile(this, "1.wav");
  guitarSounds[6] = new SoundFile(this, "1.wav");

  //Middle sounds 
  guitarSounds[7] = new SoundFile(this, "7.wav"); 
  guitarSounds[8] = new SoundFile(this, "6.wav");
  guitarSounds[9] = new SoundFile(this, "5.wav");
  guitarSounds[10] = new SoundFile(this, "4.wav");
  guitarSounds[11] = new SoundFile(this, "3.wav");
  guitarSounds[12] = new SoundFile(this, "2.wav");
  guitarSounds[13] = new SoundFile(this, "1.wav");
  
  //Deeper sounds
  guitarSounds[14] = new SoundFile(this, "7.wav"); 
  guitarSounds[15] = new SoundFile(this, "7.wav");
  guitarSounds[16] = new SoundFile(this, "7.wav");
  guitarSounds[17] = new SoundFile(this, "7.wav");
  guitarSounds[18] = new SoundFile(this, "7.wav");
  guitarSounds[19] = new SoundFile(this, "7.wav");
  guitarSounds[20] = new SoundFile(this, "7.wav");

  //Initializes lines that you can play sounds on. Each line is separated with the int spacing.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i] = new SoundLine(_x+(i*spacing), lowerPos, 600, 10, i + pitch);
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

  //Pitcher buttons
  pitchUpButton.display();
  pitchUpButton.mouseOver();
  pitchUpButton.pitchUp();

  pitchDownButton.display();
  pitchDownButton.mouseOver();
  pitchDownButton.pitchDown();
}
