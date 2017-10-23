void setup(){
  frameRate(30);
  size(500,500);
  rectMode(CENTER);
}

void draw(){
  background(0);
  pushMatrix();
  translate(250,250);
  rotate(radians(frameCount));
  rect(0,0,200,200);
  popMatrix();
}
