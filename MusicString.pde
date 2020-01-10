import javax.sound.midi.*;

class MusicString{
  
  private String[] notes = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A"};
  private MidiChannel[] channels;
  private Synthesizer synth;
  private float x_pos, y_pos, sLength;
  private int sWidth;
  private int sound;
  
  MusicString(float x_pos, float y_pos, float sLength, int sWidth, int sound){
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.sLength = sLength;
    this.sWidth = sWidth;
    this.sound = sound;
    try{
      synth = MidiSystem.getSynthesizer();
      synth.open();
      channels = synth.getChannels();
    }catch(Exception e){
      throw new RuntimeException(e);
    }
  }
  
  public void drawMe(){
    stroke(255);
    strokeWeight(sWidth);
    line(x_pos, y_pos, x_pos, y_pos + sLength);
  }
  
  public void shout(float mX, float mY){
    if(mX > x_pos - sWidth && mX < x_pos + sWidth){
      if(mY > y_pos + sLength){
        try{
          play(sound, 100);
        }catch(Exception e){
          throw new RuntimeException(e);
        }
      }
    }
  }
  
  private void play(int note, int duration) throws InterruptedException{
    channels[0].noteOn(note + 2, 80);
    Thread.sleep(duration);
    channels[0].noteOff(note);
  }
}
