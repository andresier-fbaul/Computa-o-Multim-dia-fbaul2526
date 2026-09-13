/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage img;  // Declare variable "a" of type PImage

PVector positions[ ] = new PVector[20];

void setup() {
  size(640, 360, P3D);
  iniPositions();
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("moonwalk.jpg");  // Load the image into the program  
}

void keyPressed(){
   iniPositions(); 
}


void iniPositions(){
  for(int i=0; i<20; i++ ){
    positions[i] = new PVector( random(-500,500), random(200), random(-1000,0) );
    println(positions[i]);
  }
}

void draw() {
 // float zz = -1 * mouseX;
  float zz = map ( sin(frameCount*0.005), -1,1, 500, -500)   ;
 
  camera( mouseX,0, zz,   mouseX, 0, zz-100,   0, 1, 0); // pos eye up
  
  //camera( 0, 0, mouseY,  0,0,0,  0,1,0);
  
  background(0);
  for(int i=0; i<20; i++){
    pushMatrix(); // geom transforms ops
    translate( positions[i].x, positions[i].y ,
                positions[i].z);
    rotateX(  mouseX * 0.05 );
    image( img, 0, 0  , 80, 60); // x y w h 
    popMatrix();
    
  }
  

}
