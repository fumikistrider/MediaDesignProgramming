size(800,600);
background(0);
noStroke();

colorMode(HSB, width, height, 100);

for( int x = 0; x <= width; x += 25){
  for(int y = 0; y <= height; y += 25){
    
    fill(x, y, 100);
    rect(x, y, 25, 25);

  }
}