class Spinner{

  int x;
  int y;
  int r;

  void drawRect(){
    pushMatrix();
    translate(x,y);
    rotate(radians(r));
    stroke(0);
    fill(255);
    rectMode(CENTER);
    rect(0,0,50,25);
    popMatrix();
    r++;
  }

}

Spinner sp;

void setup(){

  size(500,500);
  sp = new Spinner();
  sp.x = (int)random(width);
  sp.y = (int)random(height);
  sp.r = 0;

}

void draw(){

  background(127);
  sp.drawRect(); 

}
