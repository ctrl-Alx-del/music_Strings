SoundLine musicString [] = new SoundLine [7];

void setup() {
  size(800, 800);

  int _x = 50;


  /*for(int i = 0; i <= musicString.length-1; i++){
   musicString[i] = new SoundLine(_x,700,_x,600,100);
   }*/
  musicString[0] = new SoundLine(_x+50, 700, _x+50, 600, 100);
  musicString[1] = new SoundLine(_x, 700, _x, 500, 100);
}

void draw() {
  background(0);

  /*for(int i = 0; i <= musicString.length-1; i++){
   musicString[i].display();
   }*/

  musicString[0].display();
  musicString[1].display();

  line(0, 400, width, 400);
  musicString[0].stretch(400);
  musicString[1].stretch(500);
}
