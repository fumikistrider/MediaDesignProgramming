#  通信を使おう：ライブラリ「oscP5」

## OSCとは

- べつべつのアプリを、相互に連携させるための通信手段で「Open Sound Control (OSC)」といいます。
- プログラムの中に組み込むライブラリとして提供されています。

## OSCの仕様

 - OSCにはデータを送る「送信側」と、データを受け取る「受信側」があります。
 - 送信することができるデータは、内容を区別する「パターン(文字列)」と、数値などの情報を含める「パラメータ(引数)」があります。

## OSCの基本プログラム・送信側

~~~Java
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  oscP5 = new OscP5(this,12000); // OSCオブジェクト 12000 はポート番号
  myRemoteLocation = new NetAddress("127.0.0.1",12345); // 送信先
}

void draw() {
  background(0);  
}

void mousePressed() {
  OscMessage myMessage = new OscMessage("/test");  // testというパターンを送る
  myMessage.add(123); // 数字の 123 を送る
  oscP5.send(myMessage, myRemoteLocation); // 送信を実行する
}
~~~

## OSCの基本プログラム・受信側

~~~Java
import oscP5.*;
import netP5.*;

OscP5 oscP5;

void setup() {
  size(400,400);
  oscP5 = new OscP5(this,12345);
}

void draw() {
  background(0);  
}

void oscEvent(OscMessage theOscMessage) {
  println(" received : " + theOscMessage.addrPattern());
  println(" argument : " + theOscMessage.get(0).intValue());
}
~~~

## 受信側プログラムで、グラフィックの状態を変化させる


## 受信側プログラムで、マウスの位置を表示する
