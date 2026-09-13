
void setup() {
    size(800, 600);
}

void draw() {
    strokeWeight(5);
    stroke(0, 255, 0);
    //fill(gray); fill(r,g,b);
    fill(50);
    ellipse ( width/2, height/2, width, height );

    fill(77, 245, 240);
    stroke(0);
    ellipse ( width/2, height/2, height, height );
    fill( random(255) , random(128) , random(20) );
 //   fill( random(255) );
    //rect( width/2, height/2, 250, 100);
    rect( width/2 - 125, height/2 - 50, 250, 100);
    // point( 400, 300 );
    point( width/2, height/2 );
    point ( random(width), random(600)  );

    //line ( width/2, height/2,  random(250) , random(250) );
    line ( width/2, height/2, random(width), random(height) );
    line ( width/2, height/2, mouseX, mouseY );
}
