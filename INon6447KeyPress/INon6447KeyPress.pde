import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;


int rectWidth;
   
void setup() {
  size(640, 360);
  noStroke();
  background(0);
  rectWidth = width/4;
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6447);
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } else { 
    // It's a letter key, fill a rectangle
    fill(millis() % 255);
    float x = map(keyIndex, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
  sendOsc();
}

void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add((float)key); 
  oscP5.send(msg, dest);
}