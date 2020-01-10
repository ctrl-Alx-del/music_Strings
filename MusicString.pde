class MusicString{
  
  private float x_pos, y_pos, sLength;
  private int sWidth;
  private int sound;
  
  MusicString(float x_pos, float y_pos, float sLength, int sWidth, int sound){
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.sLength = sLength;
    this.sWidth = sWidth;
    this.sound = sound;
  }
  
  public void drawMe(){
    stroke(255);
    strokeWeight(sWidth);
    line(x_pos, y_pos, x_pos, y_pos + sLength);
  }
  
  public void shout(float mX, float mY){
    if(mX > x_pos - sWidth && mX < x_pos + sWidth){
      if(mY > y_pos + sLength){
        println("string: " + sound);
      }
    }
  }
}
