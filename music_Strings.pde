import processing.sound.*;

//Used in SoundLine and Notation class to only make notes getting added once on the sheet
boolean addOnce = false;

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
boolean [] noteChecker = new boolean [guitarSounds.length];

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
  sheetMusic = new Notation(sheetX, sheetY, sheetX2, sheetY2);

  //Sounds made from free fl studio
  //Lower Sounds
  guitarSounds[0] = new SoundFile(this, "C3.wav");
  guitarSounds[1] = new SoundFile(this, "D3.wav");
  guitarSounds[2] = new SoundFile(this, "E3.wav");
  guitarSounds[3] = new SoundFile(this, "F#3.wav");
  guitarSounds[4] = new SoundFile(this, "G#3.wav");
  guitarSounds[5] = new SoundFile(this, "A#3.wav");
  guitarSounds[6] = new SoundFile(this, "C4.wav");

  //Middle sounds 
  guitarSounds[7] = new SoundFile(this, "C4.wav"); 
  guitarSounds[8] = new SoundFile(this, "D4.wav");
  guitarSounds[9] = new SoundFile(this, "E4.wav");
  guitarSounds[10] = new SoundFile(this, "F#4.wav");
  guitarSounds[11] = new SoundFile(this, "G#4.wav");
  guitarSounds[12] = new SoundFile(this, "A#4.wav");
  guitarSounds[13] = new SoundFile(this, "C5.wav");

  //Deeper sounds
  guitarSounds[14] = new SoundFile(this, "C5.wav"); 
  guitarSounds[15] = new SoundFile(this, "D5.wav");
  guitarSounds[16] = new SoundFile(this, "E5.wav");
  guitarSounds[17] = new SoundFile(this, "F#5.wav");
  guitarSounds[18] = new SoundFile(this, "G#5.wav");
  guitarSounds[19] = new SoundFile(this, "A#5.wav");
  guitarSounds[20] = new SoundFile(this, "C6.wav");

  //Initializes lines that you can play sounds on. Each line is separated with the int spacing.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i] = new SoundLine(_x+(i*spacing), lowerPos, 600, 10, i + pitch, i, i);
  }

  //Initializes each note
  for (int i = 0; i <= notes.length-1; i++) {
    notes[i] = new Notation(sheetX+20+i*70, sheetY, 20, 15, 255);
  }

  /*for (int i = 50; i <= notes.length-1; i = i + 50) {
   notes[0] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   notes[1] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   notes[2] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   notes[3] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   notes[4] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   notes[5] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   notes[6] = new Notation(sheetX+i, sheetY, 20, 15 , 255);
   }*/

  //Initialize noteChecker as false
  for (int i = 0; i <= noteChecker.length-1; i++) {
    noteChecker[i] = false;
  }

  //NotesLetters initialized
  notesLetters  = new String [guitarSounds.length];

  //First set of letters. Each set is given a letter individually.
  notesLetters[0] = "C";
  notesLetters[1] = "D";
  notesLetters[2] = "E";
  notesLetters[3] = "G";
  notesLetters[4] = "A";
  notesLetters[5] = "B";
  notesLetters[6] = "C";

  //Second set of letters
  notesLetters[7] = "C";
  notesLetters[8] = "D";
  notesLetters[9] = "E";
  notesLetters[10] = "G";
  notesLetters[11] = "A";
  notesLetters[12] = "B";
  notesLetters[13] = "C";

  //Third set of letters
  notesLetters[14] = "C";
  notesLetters[15] = "D";
  notesLetters[16] = "E";
  notesLetters[17] = "G";
  notesLetters[18] = "A";
  notesLetters[19] = "B";
  notesLetters[20] = "C";

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
  //sheetMusic.noteChecker();

  for (int i = 0; i <= notes.length-1; i++) {
    if (noteChecker[i]) {
      notes[i].notes(i);
    }
  }
}
