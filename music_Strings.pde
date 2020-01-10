SoundLine musicString [] = new SoundLine [7];

void setup() {
  size(800, 800);

  int _x = 50;


  for(int i = 0; i <= musicString.length-1; i++){
    musicString[i] = new SoundLine(_x,700,_x,600);
  }
}

void draw() {
  background(0);

  for(int i = 0; i <= musicString.length-1; i++){
  musicString[i].display();
  musicString[i].stretch();
  }
}
