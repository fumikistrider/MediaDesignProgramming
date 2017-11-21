ArrayList<Particle> particles;

void setup(){
  size(800,600);
  // ArrayList
  particles = new ArrayList<Particle>();
  // Particle
  Particle p = new Particle(width/2, height /2);

  particles.add(p);
}

void draw(){
  background(255);

  for(int i = 0; i < particles.size(); i++){
    particles.get(i).updateTrack();
    particles.get(i).checkEdges();
    particles.get(i).display();
  }

}

void mousePressed(){
  Particle p = new Particle(random(width), random(height));
  particles.add(p);
}
