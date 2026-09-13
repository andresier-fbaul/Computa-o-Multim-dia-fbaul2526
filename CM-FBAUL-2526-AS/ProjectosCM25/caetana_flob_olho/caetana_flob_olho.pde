/**
 * Arctangent. 
 * 
 * Move the mouse to change the direction of the eyes. 
 * The atan2() function computes the angle from each eye 
 * to the cursor. 
 */
 
 
 
 
import processing.opengl.*;
import processing.video.*;
import s373.flob.*;


Capture video;   
Flob flob;       
ArrayList blobs = new ArrayList(); 
PImage videoinput;

//PSys psys;

int tresh = 5;//12;   // adjust treshold value here or keys t/T
int fade = 225;
int om = 1;
int videores=128;
String info="";
PFont font;
float fps = 60;
int videotex = 0; //case 0: videotex = videoimg;//case 1: videotex = videotexbin; 
//case 2: videotex = videotexmotion//case 3: videotex = videoteximgmotion;



 
 
 
 
Eye e1, e2, e3;

void setup() {
  size(640, 360);
  noStroke();
  e1 = new Eye( 250,  16, 120);
  e2 = new Eye( 164, 185,  80);  
  e3 = new Eye( 420, 230, 220);
  
  
  
   // init video data and stream
  video = new Capture(this, 320,240);  
  video.start();
  
  videoinput = createImage(videores, videores, RGB);

  flob = new Flob(this,videores, videores, width, height);

  flob.setThresh(tresh).setSrcImage(videotex)
  .setBackground(videoinput).setBlur(0).setOm(1).
  setFade(fade).setMirror(true,false);

 font = createFont(PFont.list()[0],16);
  textFont(font);

  
  
  
}

void draw() {
    
    
     if(video.available()) {
     video.read();
     videoinput.copy(video, 0, 0, 320, 240, 0, 0, videores, videores);
     blobs = flob.calc(flob.binarize(videoinput));
     if(frameCount<100) image(video, 0, 0, 160, 120);
  }
    
    
    
    
  background(102);
  
  int x = 0;
  int y = 0;
  
  if ( blobs.size() > 0 ){
       x = (int)flob.getABlob(0).cx;    
       y = (int)flob.getABlob(0).cy;    
  }
  
  e1.update(x, y);
  e2.update(x, y);
  e3.update(x, y);

  e1.display();
  e2.display();
  e3.display();
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153, 204, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}
