
size(800,600);
smooth();
background(255);

int x = 50;
int y = 50;

fill(0,0,200,127);
stroke(255,255,0,127);
strokeWeight(5);

while( x < width){
  ellipse(x, y, 100, 100);
  x += random(10,40);
  y += random(10,30);
}