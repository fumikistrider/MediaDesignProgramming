void setup() {
  size(300,300);
  stroke(255);
  smooth();
  frameRate(30);
}

void draw() {
  background(0);
  float s = second();
  float m = minute();
  float h = hour() % 12;

  translate(width/2, height/2);
  ellipse(0,0,width,height);

  noFill();
  stroke(255);

  // second
  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(1);
  line(0,0,0,-150);
  popMatrix();

  // minute
  pushMatrix();
  rotate(radians(m*(360/60)));
  strokeWeight(2);
  line(0,0,0,-150);
  popMatrix();

  // hour
  pushMatrix();
  rotate(radians(h*(360/12)));
  strokeWeight(4);
  line(0,0,0,-100);
  popMatrix();
}