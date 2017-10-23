# 回転と時間

## 回転させる

```Java
size(500,500);

fill(255,0,0);
rotate( radians(23) );
rect(100,100,50,50);
```

- rotateは座標そのもの（画面全体）が回転します。
- いちど回転を行うと、それ以降の座標も回転します。

```Java
size(500,500);

fill(255,0,0);
rotate( radians(23) );
rect(100,100,50,50);
rect(200,100,50,50);  // <-追加
```

 - 回転しているので、２つめのrectはまっすぐ右ではなく、斜め右下に表示されます。
 
 
## 画面の中心を軸にして、回転させる

```java:sketch_00_translate.pde
size(500,500);
rectMode(CENTER);

background(0);
pushMatrix();
translate(width/2, height/2); // <- 画面の中心が座標(0,0)に変わる
rect(0,0,200,200);  // <- 座標は(0,0)
popMatrix();
```

- 標準では左上にあった原点(0,0)が、translateによって画面の中央に移動しています

```java
size(500,500);
rectMode(CENTER);

background(0);
pushMatrix();
translate(250,250);
rotate(radians(45));  <- 「度」を「ラジアン」にする
rect(0,0,200,200);
popMatrix();
```

- 画面の真ん中を軸として、画像が回転しているのを確認しましょう。


## 時間とともに回転する

- 時計は時間が進むと共に針が回転していきます。この回転によって時間を表しているのが時計の仕組みです。

- 現在は「静止」しているプログラムで、時間が進むようにしてみます。


```java
void setup(){      <- 追加
  frameRate(30);   <- 追加
  size(500,500);
  rectMode(CENTER);
}                  <- 追加

void draw(){       <- 追加
  background(0);
  pushMatrix();
  translate(250,250);
  rotate(radians(frameCount));  <- 変更
  rect(0,0,200,200);
  popMatrix();
}                  <- 追加
```

- setup関数は、プログラム開始時に一度だけ実行されます。

- draw関数は、プログラム動作中に繰り返し実行されます。

- draw関数を実行する速さは、frameRate() で指定することができます。

```java
frameRate(10);  <- １秒間に10回繰り返す

frameRate(30);  <- １秒間に30回繰り返す（10に比べておよそ３倍早くなる)
```

- 変数 frameCount には、 プログラムを開始してからの繰り返し回数（=フレーム数) が入ります


## setup & draw と ループを組み合わせて、同時にたくさんのオブジェクトを回転させる

- forを使うと、同時に回転するグラフィックを作成することができます

```java
void setup(){
  frameRate(30);
  size(500,500);
  rectMode(CENTER);
}

void draw(){
  background(0);
  for(int x = 0; x <= width; x += 50){       <- 一つ目のループ　xを50づつ増やす
    for(int y = 0; y <= height; y += 50){    <- 二つ目のループ　yを50づつ増やす
      pushMatrix();
      translate(x,y);                        <- 座標を移動
      rotate(radians(frameCount));
      rect(0,0,50,50);                       <- 50 x 50の四角形が一斉に回転する
      popMatrix();
    }
  }
}
```

- 色もグラデーションで変化させてみます

```java
void setup(){
  frameRate(30);
  size(500,500);
  rectMode(CENTER);
  colorMode(HSB,width,height,100);  <- カラーモードを設定します
}

void draw(){
  background(0);
  for(int x = 0; x <= width; x += 50){
    for(int y = 0; y <= height; y += 50){
      pushMatrix();
      translate(x,y);
      rotate(radians(frameCount));
      fill(x,y,100);               <- 色を変化させます
      rect(0,0,50,50);
      popMatrix();
    }
  }
}
```

## 時間を切り取る　；　あるフレームの画面を保存する


