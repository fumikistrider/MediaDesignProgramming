#  ベクトルを使って動きをシミュレートしよう

## ベクトルを扱うクラス「PVector」

- ベクトルを扱うためにPVectorというクラスが用意されています。
- 「位置」のほかに、「速さ」「加速度」などのデータを作ります。
- 物を移動させるには「位置」ベクトルに「速さ」ベクトルを「足し算」します。

~~~Java
PVector location;
PVector velocity;

void setup() {
  size(640,360);
  location = new PVector(100,100);
  velocity = new PVector(2.5,5);
}

void draw() {
  background(255);

  location.add(velocity);

  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  stroke(0);
  fill(175);
  ellipse(location.x,location.y,16,16);
}
~~~

## ベクトルの引き算をする

- ベクトルを引き算すると「位置A」から「位置B」までのベクトルがわかります。

~~~Java
void setup() {
  size(640,360);
}

void draw() {
  background(255);
  PVector mouse  = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);

  mouse.sub(center);

  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
}
~~~

## ParticleクラスをPVectorを使ってアップデートする

- Particleクラスのデータにベクトルを使用します。
- データを更新する関数と、Particleを画面に表示する関数を分けます

~~~Java
class Particle{

  PVector location;      // <- 位置ベクトル
  PVector velocity;      // <- 速さ
  PVector acceleration;  // <- 加速度
  float topspeed;        // <- 最高速度(リミッター)

  Particle(float _x, float _y){  // <- コンストラクタ
    location = new PVector(_x, _y);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.002, 0.02);
    topspeed = 10;
  }

  void update(){ // ベクトルの更新
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() { // パーティクルの表示
      stroke(0);
      fill(175);
      ellipse(location.x,location.y,16,16);
  }

  void checkEdges() { // 画面端の判定
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
~~~

- アップデートしたParitcleクラスに併せて、プログラム本体を作成します。

~~~Java
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
~~~

## パーティクルがマウスを追いかけるようにしてみる

- update関数と別に、updateTrack関数を作ってみます

- マウスの現在位置ベクトルとパーティクルの現在位置ベクトルの引き算をして、移動ベクトルを計算します。

- 加速度に、移動ベクトルを入れます。

- 移動ベクトルを正規化して、大きさを「１」にします。
　ベクトルの掛け算をして、速度を調節します。


~~~Java
void updateTrack(){
  PVector mouse = new PVector(mouseX,mouseY);
  PVector dir = PVector.sub(mouse,location);
  dir.normalize();
  dir.mult(0.5);
  acceleration = dir;
    
  velocity.add(acceleration);
  velocity.limit(topspeed);
  location.add(velocity);
}
~~~



## PVector化した複数のパーティクルを扱う

- ArrayListを使って、複数のパーティクルを同時に動かしてみます

- マウスを押すと、パーティクルが追加されるようにします

~~~Java
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
~~~
