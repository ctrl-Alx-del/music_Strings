import processing.sound.*;

//Images
PImage arrowUp;
PImage arrowDown;
PImage guitarBackground;
PImage gclef;
PImage fclef;

//sounds
int numberOfSounds = 3; //numberOfSounds are the sets of sounds. Now it is 3 sets of 7
SoundLine musicString [] = new SoundLine [7];
float upperLimit = musicString.length*numberOfSounds*2/3-1; //Upper limit calculated so that pitch will not go out of bounds. It is always two-thirds so you can add more sounds with the numberOfSounds variable and the limit will follow
SoundFile guitarSounds [] = new SoundFile [musicString.length*numberOfSounds];

//Visual feedback
char [] notesLetters = new char [guitarSounds.length];

//Visual notation
Notation sheetMusic; //The music sheet where the notes go onto
Notation [] notes = new Notation [guitarSounds.length]; //An array of notes 
boolean [] noteChecker = new boolean [guitarSounds.length]; //An array of booleans to control which note should be displayed

//Music sheet coordinates
int sheetX = 900; 
int sheetY = 50;
int sheetX2 = 1400; 
int sheetY2 = 250;
int yPosSheet = 150; //YposSheet is for moving the notes and sheet around on the y-axis. The same goes for XposSheet.
int xPosSheet = -200; 
int noteMiddle = 250; //Adjusts the notes to always be in the middle of the music sheet

//Note sizes
int noteHeight = 20;
int noteWidth = 15;
int noteStroke = 0;

//Buttons
Button pitchUpButton;
Button pitchDownButton;

//musicStrings variables
int lowerPos = 750; //The bottom of the lines
int upperPos = 250; // The maximum length the first line can get to
int upperPosStart = 600; //upperPosStart is where all the lines start at. Should always be lower than upperPos or else all the strings will be above their limit to start with. 
int _x = 50; //x coordinate for the first musicString
int _thickness = 10; //Thickness of the lines
int spacing = 100; //spacing = 100 gives a spacing that fits the window. Can be changed for bigger windows
int tilt = 50; // Controls how much each line should be lower than the other

//Button variables
int pitch = 0; //Variable to switch the guitarSounds array to the deeper or higher sounds
int level = 1; //Used to visually see what level of pitch you are on

//Button coordinates
int buttonUpX = 300;
int buttonUpY = 170; 
int buttonDownX = 400;
int buttonDownY = 170;
int buttonSize = 50;

//Strings are used to control which button should be displayed. Otherwise fx. two up arrows would be displayed at each button, because the display function is called on both.
String up = "up";
String down = "down";


void setup() {
  size(1300, 800);

  //Buttons initialized
  pitchUpButton = new Button(buttonUpX, buttonUpY, buttonSize, buttonSize, up);
  pitchDownButton = new Button(buttonDownX, buttonDownY, buttonSize, buttonSize, down);

  //Notation initialized
  sheetMusic = new Notation(sheetX, sheetY, sheetX2, sheetY2);

  //Sounds made from a free version of fl Studio
  //Deeper Sounds
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

  //Higher sounds
  guitarSounds[14] = new SoundFile(this, "C5.wav"); 
  guitarSounds[15] = new SoundFile(this, "D5.wav");
  guitarSounds[16] = new SoundFile(this, "E5.wav");
  guitarSounds[17] = new SoundFile(this, "F#5.wav");
  guitarSounds[18] = new SoundFile(this, "G#5.wav");
  guitarSounds[19] = new SoundFile(this, "A#5.wav");
  guitarSounds[20] = new SoundFile(this, "C6.wav");

  //Initializes lines that you can play sounds on. Each line is separated with the int spacing. i ties each musicString[i] with a specific sound, text and boolean.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i] = new SoundLine(_x+(i*spacing), lowerPos, upperPosStart, _thickness, i + pitch, i, i);
  }

  //Variables used to calculate where the notes should be. They all start on the top line in the music sheet, wholeStep is used to jump one line, halfstep is used to jump in between lines. 
  //The number variables are the times of wholeSteps down from the first line
  int wholeStep = 50;
  int halfStep = 25;
  int six = 6;
  int five = 5;
  int four = 4;
  int three = 3;
  int two = 2;

  //First set of notes
  notes[0] = new Notation(sheetX, sheetY+wholeStep*six, noteHeight, noteWidth, noteStroke);
  notes[1] = new Notation(sheetX, sheetY+wholeStep*five+halfStep, noteHeight, noteWidth, noteStroke);
  notes[2] = new Notation(sheetX, sheetY+wholeStep*five, noteHeight, noteWidth, noteStroke);
  notes[3] = new Notation(sheetX, sheetY+wholeStep*four, noteHeight, noteWidth, noteStroke);
  notes[4] = new Notation(sheetX, sheetY+wholeStep*three+halfStep, noteHeight, noteWidth, noteStroke);
  notes[5] = new Notation(sheetX, sheetY+wholeStep*three, noteHeight, noteWidth, noteStroke);
  notes[6] = new Notation(sheetX, sheetY+wholeStep*two+halfStep, noteHeight, noteWidth, noteStroke);


  //Second set of notes
  notes[7] = new Notation(sheetX, sheetY+wholeStep*two+halfStep, noteHeight, noteWidth, noteStroke);
  notes[8] = new Notation(sheetX, sheetY+wholeStep*two, noteHeight, noteWidth, noteStroke);
  notes[9] = new Notation(sheetX, sheetY+wholeStep+halfStep, noteHeight, noteWidth, noteStroke);
  notes[10] = new Notation(sheetX, sheetY+halfStep, noteHeight, noteWidth, noteStroke);
  notes[11] = new Notation(sheetX, sheetY, noteHeight, noteWidth, noteStroke);
  notes[12] = new Notation(sheetX, sheetY-halfStep, noteHeight, noteWidth, noteStroke);
  notes[13] = new Notation(sheetX, sheetY-wholeStep, noteHeight, noteWidth, noteStroke);

  //Third set of notes
  notes[14] = new Notation(sheetX, sheetY+wholeStep*five, noteHeight, noteWidth, 255);
  notes[15] = new Notation(sheetX, sheetY+wholeStep*four+halfStep, noteHeight, noteWidth, 255);
  notes[16] = new Notation(sheetX, sheetY+wholeStep*four, noteHeight, noteWidth, 255);
  notes[17] = new Notation(sheetX, sheetY+wholeStep*three, noteHeight, noteWidth, 255);
  notes[18] = new Notation(sheetX, sheetY+wholeStep*two+halfStep, noteHeight, noteWidth, 255);
  notes[19] = new Notation(sheetX, sheetY+wholeStep*two, noteHeight, noteWidth, 255);
  notes[20] = new Notation(sheetX, sheetY+wholeStep+halfStep, noteHeight, noteWidth, 255);

  //Initialize the whole noteChecker array as false
  for (int i = 0; i <= noteChecker.length-1; i++) {
    noteChecker[i] = false;
  }

  //First set of letters. Each set is given a letter individually.
  notesLetters[0] = 'C';
  notesLetters[1] = 'D';
  notesLetters[2] = 'E';
  notesLetters[3] = 'G';
  notesLetters[4] = 'A';
  notesLetters[5] = 'B';
  notesLetters[6] = 'C';

  //Second set of letters
  notesLetters[7] = 'C';
  notesLetters[8] = 'D';
  notesLetters[9] = 'E';
  notesLetters[10] = 'G';
  notesLetters[11] = 'A';
  notesLetters[12] = 'B';
  notesLetters[13] = 'C';

  //Third set of letters
  notesLetters[14] = 'C';
  notesLetters[15] = 'D';
  notesLetters[16] = 'E';
  notesLetters[17] = 'G';
  notesLetters[18] = 'A';
  notesLetters[19] = 'B';
  notesLetters[20] = 'C';

  //Images
  arrowUp = loadImage("arrowUp.png"); //arrow image downloaded from: https://www.pngfuel.com/free-png/ofonr
  arrowDown = loadImage("arrowDown.png");
  guitarBackground = loadImage("guitarbackground.jpg"); //Image reference: https://www.needpix.com/photo/download/1837726/music-background-music-note-digital-paper-piano-melody-texture-scrapbook-pattern-musical
  gclef = loadImage("gclef.png"); //
  fclef = loadImage("fclef.png"); //
}


void draw() {
  background(0);
  image(guitarBackground, 0, 0);

  //First musicString in the array is the one most left and so on. Display is called on each object.
  for (int i = 0; i <= musicString.length-1; i++) { 
    musicString[i].display();
  }

  //Makes the strings go upwards in the beginning. Animation. The argument goes into limit in the stretch function. Each line has its own limit.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i].stretch(upperPos+(i*tilt));
  }

  //Hitbox for the strings. Each lines hitbox follows its position and tilt.
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i].hitBox(i*spacing, i*tilt);
  }

  //Pitcher buttons
  //Up
  pitchUpButton.display();
  pitchUpButton.mouseOver();
  pitchUpButton.pitchUp();
  //Down
  pitchDownButton.display();
  pitchDownButton.mouseOver();
  pitchDownButton.pitchDown();

  //The music sheet where the notes are on
  sheetMusic.display(yPosSheet, xPosSheet);

  //If one of the lines get hit noteChecker becomes true and displays the corresponding note visually.
  for (int i = 0; i <= notes.length-1; i++) {
    if (noteChecker[i]) {
      notes[i].notes(yPosSheet, xPosSheet+noteMiddle);
    }
  }
}
