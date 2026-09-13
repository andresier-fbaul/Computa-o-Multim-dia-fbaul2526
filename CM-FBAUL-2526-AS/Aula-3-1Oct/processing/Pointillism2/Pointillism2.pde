/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 */

PImage img;
int smallPoint, largePoint;

void setup() {
  size(640, 360);
  img = loadImage("moonwalk.jpg");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CORNER);
  noStroke();
  background(255);
}

void draw() {
  //  image(img, 0,0,width,height);
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
 // ellipse(x, y, pointillize, pointillize);
  stroke(pix);
  line(x,y, x+random(-10,10), y + random(-20,20) );

    image(img, mouseX, mouseY, 30, 20);
}
