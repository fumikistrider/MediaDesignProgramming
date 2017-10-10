
size(800,600);
smooth();
background(255);

int x = 0;
int y = height;

while( x < width ){
  stroke(random(255), random(255), random(255));
  line(x, 0, x, y);
  x++;
}