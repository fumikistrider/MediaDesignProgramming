#  ライブラリを使おう：物理エンジン「Box2D」

## ライブラリとは

- 様々な機能や特徴をもったクラスを集めた、誰でも参照できるクラスの図書館（ライブラリ）です。
- ライブラリを使えばプログラムを効率的に製作できます。

## Box2Dとは

- 物の動きや、重力など、さまざまな物理法則を利用できるライブラリです。
- 自分で作ったプログラムやクラスを入れ物（フレーム）として、動きを組み込むことができるので「物理エンジン」とも呼ばれます。


## Box2Dを使うためには

 - ライブラリをダウンロードします。
 - [http://www.shiffman.net/p5/libraries/box2d_processing/box2d_processing.zip](http://www.shiffman.net/p5/libraries/box2d_processing/box2d_processing.zip "Box2D")

 - Processingのライブラリフォルダにダウンロードしたファイルをコピーします
 - Processingを起動します。


## 箱を作る

 - まずは物理エンジンのついていないプログラムを作成します。

 ~~~Java
 // Boxタブ
 class Box{

   float x,y;
   float w,h;

   // コンストラクタ
   Box(float x_, float y_) {
     x = x_;
     y = y_;
     w = 16;
     h = 16;
   }

   // 箱の描画
   void display() {
     fill(175);
     stroke(0);
     rectMode(CENTER);
     rect(x,y,w,h);
   }
 }
 ~~~

~~~Java
ArrayList<Box> boxes;

void setup() {
  size(400,300);
  smooth();
  // Boxの配列ArrayListをつくる
  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);

  // マウスが押されていたらBoxを新しく作成して追加
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }

  // 箱を表示
  for (Box b: boxes) {
    b.display();
  }
}
~~~

## Box2Dの物理法則が働くようにしてみよう

 - Box2Dを使うには、「ワールド」を作成して、その中でBox2Dの物体を動かします。
 -

 ~~~Java
 import shiffman.box2d.*;
 import org.jbox2d.collision.shapes.*;
 import org.jbox2d.common.*;
 import org.jbox2d.dynamics.*;

 ArrayList<Box> boxes;

 Box2DProcessing box2d;

 void setup() {
   size(400,300);
   smooth();

   // Box2Dを初期化し、Box2DのWorldを作成する
   box2d = new Box2DProcessing(this);
   box2d.createWorld();

   // Boxの配列ArrayListをつくる
   boxes = new ArrayList<Box>();
 }

 void draw() {
   background(255);

   // Worldを更新する
   box2d.step();

   // マウスが押されていたらBoxを新しく作成して追加
   if (mousePressed) {
     Box p = new Box(mouseX,mouseY);
     boxes.add(p);
   }

   // 箱を表示
   for (Box b: boxes) {
     b.display();
   }
 }

 ~~~

 ##

 - Boxクラスに物理エンジンの法則が反映されるようにするために、「Body」を作ります
 - Bodyに様々な属性をセットすることで、物理エンジンの機能が実際に動くようになります。

 ~~~Java
 Body body;   //   Bodyオブジェクト

 float w,h;

 Box(float x, float y) {
   w = 16;
   h = 16;

   // Build Body
   BodyDef bd = new BodyDef();			
   bd.type = BodyType.DYNAMIC;
   bd.position.set(box2d.coordPixelsToWorld(x,y));
   body = box2d.createBody(bd);

  // 四角形の形を定義します
   PolygonShape sd = new PolygonShape();
   float box2dW = box2d.scalarPixelsToWorld(w/2);
   float box2dH = box2d.scalarPixelsToWorld(h/2);
   sd.setAsBox(box2dW, box2dH);		   

   // 物体の特徴を定義します
   FixtureDef fd = new FixtureDef();
   fd.shape = sd;
   // パラメータの設定
   fd.density = 1;
   fd.friction = 0.3;
   fd.restitution = 0.5;

   // bodyに物体の特徴をセットします						   
   body.createFixture(fd);
 }
~~~

- display関数を、Box2Dを使用するように変更します

~~~Java
void display() {
  // 物体がある座標と、回転角度を得ます
  Vec2 pos = box2d.getBodyPixelCoord(body);		
  float a = body.getAngle();

  pushMatrix();
  translate(pos.x,pos.y);		// 物体の座標位置を設定する
  rotate(-a);			        // 物体を回転させる
  fill(175);
  stroke(0);
  rectMode(CENTER);
  rect(0,0,w,h);
  popMatrix();
}
~~~

## 空間の中に、床を作ってみる

 - 動く物体の他に、その場から動かない物体をつくることもできます。
 - 動かない物体 Boundary クラスを作って配置してみます

 ~~~Java
 class Boundary {

   float x;
   float y;
   float w;
   float h;

   Body b;

   Boundary(float x_,float y_, float w_, float h_) {
     x = x_;
     y = y_;
     w = w_;
     h = h_;

     // 形状をつくります
     PolygonShape sd = new PolygonShape();
     // Figure out the box2d coordinates
     float box2dW = box2d.scalarPixelsToWorld(w/2);
     float box2dH = box2d.scalarPixelsToWorld(h/2);
     sd.setAsBox(box2dW, box2dH);


     // Bodyの属性を作ります　BodyTypeを STATIC (動かないもの)にしまｓ
     BodyDef bd = new BodyDef();
     bd.type = BodyType.STATIC;
     bd.position.set(box2d.coordPixelsToWorld(x,y));
     b = box2d.createBody(bd);

     b.createFixture(sd,1);
   }

   // 動かない物体を表示します
   void display() {
     fill(0);
     stroke(0);
     rectMode(CENTER);
     rect(x,y,w,h);
   }

 }
 ~~~

~~~Java
ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;

Box2DProcessing box2d;

void setup() {
  size(400,300);
  smooth();

  // Box2Dを初期化し、Box2DのWorldを作成する
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10); // 重力を設定する

  // Boxの配列ArrayListをつくる
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // 床をつくる
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));

}

void draw() {
  background(255);

  // Worldを更新する
  box2d.step();

  // マウスが押されていたらBoxを新しく作成して追加
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }

  // 床を表示
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // 箱を表示
  for (Box b: boxes) {
    b.display();
  }

}
~~~
