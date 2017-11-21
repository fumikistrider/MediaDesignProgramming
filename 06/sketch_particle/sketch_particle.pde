Particle p;

void setup(){
  size(800,600);
  p = new Particle(width/2, height /2);
}

void draw(){
  background(255);
  p.update();
  p.checkEdges();
  p.display();
}
