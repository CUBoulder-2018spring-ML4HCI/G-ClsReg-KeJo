import processing.sound.*;
import oscP5.*;
import netP5.*;
TriOsc triangle;

OscP5 oscP5;
NetAddress dest;

void setup() {
  size(640, 360);
  background(255);
  oscP5 = new OscP5(this,10000);
  //dest = new NetAddress("127.0.0.1",6448);
    
  // Create triangle wave oscillator.
  triangle = new TriOsc(this);
  //triangle.play();
}

void draw() {
}

int frequency;
int pressedKey;

void oscEvent(OscMessage theOscMessage) {
 println("received message");
    if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
      if(theOscMessage.checkTypetag("f")) {
      float f = theOscMessage.get(0).floatValue();
      println("received1");
       keyPressed(int(f));
      }
    }
}

void keyPressed(int OSCFreq) {
    triangle.freq(OSCFreq*27+193);
    triangle.play();
    delay(200);
    triangle.stop();
}