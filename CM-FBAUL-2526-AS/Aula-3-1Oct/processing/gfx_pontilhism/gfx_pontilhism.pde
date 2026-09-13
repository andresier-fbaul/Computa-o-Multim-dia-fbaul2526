PImage imagemaula;

void setup() {
    size(640, 360);
    imagemaula = loadImage("moonwalk.jpg");
    // comentario
    background(128);
    image( imagemaula, 0,0,width,height);
    // elipse ( centrox,cy, larg, alt)
    fill(255,0,0, 50);//cor de preenchimento
    stroke(0,255,0, 50);// cor de contorno
    ellipse(width/2, height/2, 250, 250);
}

void draw() {
   // image( imagemaula, 0,0,width,height);
  
    println("rato xy: "+ mouseX + " " + mouseY);  
    
    // rect x y w h
    rect(mouseX, mouseY, 25, random(10,25) );
    
    stroke(random(255));
    line(width/2, height/2, 
        mouseX, mouseY);
        
    draw_pontilhismo();
}


void draw_pontilhismo() {
  float pointillize = map(mouseX, 0, width, 10 , 100);
  int x = int(random(imagemaula.width));
  int y = int(random(imagemaula.height));
  color pix = imagemaula.get(x, y);
  fill(pix, 200);
  noStroke();
  ellipse(x, y, pointillize, pointillize);
  stroke(pix, 25); // rgb + alpha
  line(width/2,height/2, x, y);
}
