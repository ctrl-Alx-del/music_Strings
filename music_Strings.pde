MusicString[] mString = new MusicString[10];
int numberOfStrings = 10;

void setup() {
  size(800, 800);
  
  for(int i = 0; i < numberOfStrings; i++){
    mString[i] = new MusicString(40 + 80f * i, 800f, -500f + i * 20f, 8, i); 
  }
}

void draw() {
  background(0);
  for(MusicString ms : mString){
    ms.drawMe();
    ms.shout(mouseX, mouseY);
  }
}
