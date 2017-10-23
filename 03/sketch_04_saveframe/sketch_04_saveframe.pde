void setup(){
  frameRate(30);
  size(500,500);
  rectMode(CENTER);
  colorMode(HSB,width,height,100);
}

void draw(){
  background(0);
  for(int x = 0; x <= width; x += 50){
    for(int y = 0; y <= height; y += 50){
      pushMatrix();
      translate(x,y);
      rotate(radians(frameCount));
      fill(x,y,100);
      rect(0,0,50,50);
      popMatrix();
    }
  }
}

void mousePressed(){
  saveFrame("screen.png");
}
