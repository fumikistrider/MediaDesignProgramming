class Particle{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Particle(float _x, float _y){  // <-  コンストラクタ（クラスメイト同じ名前の関数にする）
    location = new PVector(_x, _y);
    velocity = new PVector(0,0);
    acceleration = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
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
    acceleration = dir.mult(0.5);

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
      velocity.x = -0.5 * velocity.x;
    } else if (location.x < 0) {
      velocity.x = -0.5 * velocity.x;
    }

    if (location.y > height) {
      velocity.y = -0.5 * velocity.y;
    } else if (location.y < 0) {
      velocity.y = -0.5 * velocity.y;
    }
  }

}
