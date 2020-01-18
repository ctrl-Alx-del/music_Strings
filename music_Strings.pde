import processing.sound.*;

//Images
PImage arrowUp;
PImage arrowDown;

//sounds
//numberOfSounds are the sets of sounds. Now it is 3 sets of 7
int numberOfSounds = 3;
SoundLine musicString [] = new SoundLine [7];
float upperLimit = musicString.length*numberOfSounds*2/3-1;
SoundFile guitarSounds [] = new SoundFile [musicString.length*numberOfSounds];

//Visual feedback
String [] notesLetters;
String [] chords = new String [numberOfSounds];

//Visual notation
Notation sheetMusic;
Notation [] notes = new Notation [musicString.length];

//Buttons
Button pitchUpButton;
Button pitchDownButton;

//musicStrings variables
int lowerPos = 700;
int upperPos = 200; // The maximum length a line can get to
int middlePos = upperPos-lowerPos;
int tilt = 50; // Controls how much each line should be lower than the other
int pitch = 0; //Variable to switch the guitarSounds array to the deeper sounds
int level = 1; //Used to visually see what level of pitch you are on

//spacing = 100 gives a spacing that fits the window. Can be changed for bigger windows
int spacing = 100;

void setup() {
  size(1600, 800);
  //x coordinate for the first musicString
  int _x = 50; 

  int buttonUpX = 300;
  int buttonDownX = 400;
  int buttonUpY = 50;
  int buttonDownY = 50;
  int buttonSize = 50;

  //Strings are used to control which button should be displayed. Otherwise fx. two up arrows would be displayed at each button
  String up = "up";
  String down = "down";

  //Buttons initialized
  pitchUpButton = new Button(buttonUpX, buttonUpY, buttonSize, buttonSize, buttonUpX, buttonUpY, up);
  pitchDownButton = new Button(buttonDownX, buttonDownY, buttonSize, buttonSize, buttonDownX, buttonDownY, down);
  
  int sheetX = 900; 
  int sheetY = 50;
  int sheetX2 = 1400; 
  int sheetY2 = 250;
  
  //Notation initialized
  sheetMusic = new Notation(sheetX,sheetY, sheetX2, sheetY2);

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
    musicString[i] = new SoundLine(_x+(i*spacing), lowerPos, 600, 10, i + pitch, i);
  }
  
  //Initializes each note
  for(int i = 0; i <= notes.length-1; i++) {
    notes[i] = new Notation(50,50,50,50);
  }

  //NotesLetters initialized
  notesLetters  = new String [guitarSounds.length];
  
  //First set of letters. Each set is given a letter individually.
  notesLetters[0] = "A";
  notesLetters[1] = "B";
  notesLetters[2] = "C";
  notesLetters[3] = "D";
  notesLetters[4] = "E";
  notesLetters[5] = "F";
  notesLetters[6] = "G";

  //Second set of letters
  notesLetters[7] = "H";
  notesLetters[8] = "I";
  notesLetters[9] = "J";
  notesLetters[10] = "K";
  notesLetters[11] = "L";
  notesLetters[12] = "M";
  notesLetters[13] = "N";

  //Third set of letters
  notesLetters[14] = "O";
  notesLetters[15] = "P";
  notesLetters[16] = "Q";
  notesLetters[17] = "R";
  notesLetters[18] = "S";
  notesLetters[19] = "T";
  notesLetters[20] = "U";

  //Chord initialized
  chords[0] = "A";
  chords[1] = "B";
  chords[2] = "E-standard";

  //Images
  arrowUp = loadImage("arrowUp.png");
  arrowDown = loadImage("arrowDown.png");
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
    musicString[i].hitBox(i*spacing, i*tilt);
  }

  //Pitcher buttons
  pitchUpButton.display();
  pitchUpButton.mouseOver();
  pitchUpButton.pitchUp();
  pitchUpButton.chordText();

  pitchDownButton.display();
  pitchDownButton.mouseOver();
  pitchDownButton.pitchDown();
  
  sheetMusic.display();
  sheetMusic.notes();
}
