class Particle{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Particle(float _x, float _y){  // <-  コンストラクタ（クラスメイト同じ名前の関数にする）
    location = new PVector(_x, _y);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.002, 0.02);
    topspeed = 10;
  }

  void update(){
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void updateTrack(){
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
      stroke(0);
      fill(175);
      ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }

}
