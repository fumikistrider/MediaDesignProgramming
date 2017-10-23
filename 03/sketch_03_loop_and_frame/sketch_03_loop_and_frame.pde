void setup(){
  frameRate(30);
  size(500,500);
  rectMode(CENTER);
}

void draw(){
  background(0);
  for(int x = 0; x <= width; x += 50){
    for(int y = 0; y <= height; y += 50){
      pushMatrix();
      translate(x,y);
      rotate(radians(frameCount));
      rect(0,0,50,50);
      popMatrix();
    }
  }
}
