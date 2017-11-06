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

ArrayList<Spinner> spArray;
int number = 30;

void setup(){

  size(500,500);
  spArray = new ArrayList<Spinner>();

  for(int i = 0; i < number; i++){
    Spinner sp = new Spinner();
    sp.x = (int)random(width);
    sp.y = (int)random(height);
    sp.r = (int)random(360);
    spArray.add(sp);
  }


}

void draw(){

  background(127);

  for(int i = 0; i < number; i++){
    spArray.get(i).drawRect();
  }

}
