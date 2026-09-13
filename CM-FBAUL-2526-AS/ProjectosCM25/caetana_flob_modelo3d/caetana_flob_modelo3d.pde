// AS: flob permarotates models, Computacao Multimedia 2526

import processing.video.*;
import s373.flob.*;


// modelos
PShape rocketOlhoEsquerdo;
PShape rocketOlhoDireito;
PShape rocketCorpo;

float rotOlhoEsquerdoX, rotOlhoEsquerdoY;
float rotOlhoDireitoX, rotOlhoDireitoY;
float rotCorpoX,rotCorpoY;

// posicoes dos objs na cena, e para calc angulos
float posOlhoEsquerdoX = 100, posOlhoEsquerdoY = 100;
float posOlhoDireitoX = 700, posOlhoDireitoY = 100;
float posCorpoX = 500, posCorpoY = 250;

// video cv vars
Capture video;   
Flob flob;       
ArrayList blobs = new ArrayList(); 
PImage videoinput;


int tresh = 5;//12;   // adjust treshold value here or keys t/T
int fade = 225;
int om = 1;
int videores=128;
String info="";
PFont font;
float fps = 60;
int videotex = 0; //case 0: videotex = videoimg;//case 1: videotex = videotexbin; 
//case 2: videotex = videotexmotion//case 3: videotex = videoteximgmotion;



void setup() {
  size(1280, 720, P3D);
  noStroke();

  rocketOlhoEsquerdo = loadShape("rocket.obj");
  rocketOlhoDireito = loadShape("rocket.obj");
  rocketCorpo = loadShape("rocket.obj");


  
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
  
 // image(flob.getSrcImage(), 0, 0, width, height);
  
  
  
  int flob_x = width/2;
  int flob_y = height/2;
  
  if ( blobs.size() > 0 ){
       flob_x = (int)flob.getABlob(0).cx;    
       flob_y = (int)flob.getABlob(0).cy;    
  }
  
  float deltaOlhoEsqX = flob_x - posOlhoEsquerdoX;
  float deltaOlhoEsqY = flob_y - posOlhoEsquerdoY;
  
  rotOlhoEsquerdoX = -atan2(deltaOlhoEsqY, 10); //ajustar o 100 para sensibilidade
  rotOlhoEsquerdoY = atan2(deltaOlhoEsqX, 10); //ajustar o 100 para sensibilidade
 
  pushMatrix();
  translate(posOlhoEsquerdoX, posOlhoEsquerdoY, -100);
  rotateX(rotOlhoEsquerdoX);
  rotateY(rotOlhoEsquerdoY);
  shape(rocketOlhoEsquerdo);
  popMatrix();
  
  
  
  
  float deltaOlhoDirX = flob_x - posOlhoDireitoX;
  float deltaOlhoDirY = flob_y - posOlhoDireitoY;
  
  rotOlhoDireitoX = -atan2(deltaOlhoDirY, 10); //ajustar o 100 para sensibilidade
  rotOlhoDireitoY = atan2(deltaOlhoDirX, 10); //ajustar o 100 para sensibilidade
 
  pushMatrix();
  translate(posOlhoDireitoX, posOlhoDireitoY, -100);
  rotateX(rotOlhoDireitoX);
  rotateY(rotOlhoDireitoY);
  shape(rocketOlhoDireito);
  popMatrix();

  
  
  float deltaCorpoX = flob_x - posCorpoX;
  float deltaCorpoY = flob_y - posCorpoY;
  
  rotCorpoX = -atan2(deltaCorpoY, 10); //ajustar o 100 para sensibilidade
  rotCorpoY = atan2(deltaCorpoX, 10); //ajustar o 100 para sensibilidade
 
  pushMatrix();
  translate(posCorpoX, posCorpoY, -100);
  
  scale(1.5);
  
  rotateX(rotCorpoY);
  rotateY(rotCorpoX);
  shape(rocketCorpo);
  popMatrix();

  
  
  
  //e1.update(x, y);
  //e2.update(x, y);
  //e3.update(x, y);

  //e1.display();
  //e2.display();
  //e3.display();
}




//class Eye {
//  int x, y;
//  int size;
//  float angle = 0.0;
  
//  Eye(int tx, int ty, int ts) {
//    x = tx;
//    y = ty;
//    size = ts;
// }

//  void update(int mx, int my) {
//    angle = atan2(my-y, mx-x);
//  }
  
//  void display() {
//    pushMatrix();
//    translate(x, y);
//    fill(255);
//    ellipse(0, 0, size, size);
//    rotate(angle);
//    fill(153, 204, 0);
//    ellipse(size/4, 0, size/2, size/2);
//    popMatrix();
//  }
//}
