
ArrayList<Particle> particles;

void setup(){
  size(500,500);
  background(0);
  
  particles = new ArrayList<Particle>(); // <- ArrayListをつくる
  
  Particle p = new Particle(100,100); // <- Particleをつくる
  
  particles.add(p); // <- ArrayListにParticleを追加する
}

void draw(){
  //background(0);
  
  for(int i = 0; i < particles.size(); i++ ){
    particles.get(i).drawParticle();
  }
  
}

void mousePressed(){
  Particle p = new Particle(mouseX, mouseY);
  particles.add(p);
}