import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Boxタブ
class Box{

  Body body;   //   Bodyオブジェクト
  float w,h;

  // コンストラクタ
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

  // 箱の描画
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
}


class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;

  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);

    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}

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
