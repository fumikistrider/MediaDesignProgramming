size(500,500);
smooth();
background(0);
stroke(255);
noFill();

rectMode(CENTER);

translate(250,250);

for(int i = 0; i < 90; i+= 5){
  pushMatrix();
  rotate(radians(i));
  rect(0,0,250,250);
  popMatrix();
}