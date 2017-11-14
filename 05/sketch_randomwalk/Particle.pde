class Particle{

  float x;
  float y;

  Particle(float _x, float _y){  // <-  コンストラクタ（クラスメイト同じ名前の関数にする）
    x = _x;
    y = _y;
  }

  void drawParticle(){
    noStroke();
    fill(0,0,255,200);    
    ellipse(x,y,10,10);
    
    x = x + random(-3,3);
    y = y + random(-3,3);
  }

}