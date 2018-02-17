//This demo triggers a text display with each new message
// Works with 1 classifier output, any number of classes
//Listens on port 12000 for message /wek/outputs (defaults)

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;


//No need to edit:
PFont myFont, myBigFont;
final int myHeight = 700;
final int myWidth = 700;
int frameNum = 0;
int currentHue = 255;
int currentTextHue = 255;
String currentMessage = "Start by hitting Run on Wekinator," + "\n" + "then play an A key";
String currentImage = "letteredKeyboard.png";

String[] messages = {
   "N/a",
  "Good! Play a B",
  "Play a C#",
  "Play a D",
  "Play an E",
  //"Play an E"
};

//String[] images = {
// "N/a",
// "Hello.png",
// "Good.png",
// "Morning.png",
// "HowAre.png",
// "You.png"
//};

void setup() {
  //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  colorMode(HSB);
  size(1000,700, P3D);
  smooth();
  background(255);
  
  String typeTag = "f";
  //myFont = loadFont("SansSerif-14.vlw");
  myFont = createFont("Arial", 36);
  myBigFont = createFont("Arial", 80);
  //textAlign(CENTER);
  //rectMode(CENTER);
}

void draw() {
  frameRate(30);
  background(0, 0, 0);
  drawText();
}
int trackingIndex;
//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 println("received message");
    if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
      if(theOscMessage.checkTypetag("f")) {
      float f = theOscMessage.get(0).floatValue();
      println("received1");
       showMessage((int)f);
       trackingIndex = (int)f;
      }
    }
 
}



void showMessage(int i) {
    currentHue = 0;
    currentTextHue = 255;
    if (i != trackingIndex+1 && i!= 1){
       currentMessage = "Oops, you went out of order!" + "\n" + "Play an A Again";
       currentImage = "black.jpeg";
    } else if (i == 5){
      currentMessage = "Well done! You played a simple A scale";
      currentImage = "letteredKeyboard.png";
      delay(3000);
    }  else {
      currentMessage = messages[i];
      currentImage = "letteredKeyboard.png";
    }  
    
}

//Write instructions to screen.

void drawText() {
    PImage img;
    img = loadImage(currentImage);
    image(img, 0, 0);
    stroke(0);
    textFont(myFont);
    textAlign(TOP); 
    fill(currentTextHue, 255, 255);

    //text("Receives 1 classifier output message from wekinator", 10, 10);
    //text("Listening for OSC message /wek/outputs, port 12000", 10, 30);
    
    
    textFont(myFont);
    text(currentMessage, 300, 300);
}


float generateColor(int which) {
  float f = 100; 
  int i = which;
  if (i <= 0) {
     return 100;
  } 
  else {
     return (generateColor(which-1) + 1.61*255) %255; 
  }
}