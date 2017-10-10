
size(400,400);
smooth();
background(255);

int var = 50;

fill(0,0,200,127);
stroke(255,255,0,127);
strokeWeight(5);

while( var < 400){
  ellipse(var, var, 100, 100);
  var += 50;
}