size(800,600);
background(0);
noStroke();

// while Loop

int x = 0;

while( x <= width ){
  fill(200,200,0,200);
  ellipse(x, 200, 50, 50);
  x += 50;
}


// for Loop

for( int i = 0; i <= width; i += 50 ){
  fill(0,200,200,200);
  ellipse(i, 400, 50, 50);
}