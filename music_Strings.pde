SoundLine musicString [] = new SoundLine [7];
int lowerPos = 700;
int upperPos = 200; // The maximum length a line can get to
int middlePos = upperPos-lowerPos;
int tilt = 50; // Controls how much each line should be lower than the other


void setup() {
  size(800, 800);

  int _x = 50;
  int spacing = 100;


  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i] = new SoundLine(_x+(i*spacing), lowerPos, _x+(i*spacing), 600);
  }
}


void draw() {
  background(0);
  //First musicString in the array is the one most left and so on
  for (int i = 0; i <= musicString.length-1; i++) { 
    musicString[i].display();
  }


  //Makes the strings go upwards in the beginning. Animation
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i].stretch(upperPos+(i*tilt));
  }

  //Invisible hitbox for the strings
  for (int i = 0; i <= musicString.length-1; i++) {
    musicString[i].hitBox(tilt*i);
  }
}
