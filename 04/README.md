# 回転するオブジェクト「Spinner」を作る

## オブジェクトを作るための「クラス」を作る

```Java
class Spinner{

}
```

- class クラス名　を記述して、オブジェクトを作るためのクラスを定義します。
- オブジェクトはこのクラス定義を元に作られます。

## クラスの中にデータ（属性）をつくる

```Java
class Spinner{

  int x;
  int y;
  int r;

...

```

 - クラスの中に変数を作成して、そのクラスの属性をつくります。
 - Spinnerオブジェクトの位置としてx座標y座標と、回転のrを変数とします。
 - この他にも名前などの文字列や、画像データなどを属性として持たせることができます。

## オブジェクトを回転させる動作（関数）をつくる

```Java
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
```

 - Spinnerクラスの中に、drawRectという関数をつくります。
 - draw関数の中で、spinnerオブジェクトのdrawRect関数を呼び出します
 - spinnerオブジェクトの作り方は次の節で解説します。


## オブジェクトを「生成」する

```Java
Spinner sp;

void setup(){

  size(500,500);
  sp = new Spinner();
  sp.x = (int)random(width);
  sp.y = (int)random(height);
  sp.r = 0;

}
```

 - Spinnerオブジェクトである sp を準備しています。見た目はintなどの変数と同じです。
 - setup関数の中で、「new」を使って新しいオブジェクトをつくります。（オブジェクトの生成）
 - オブジェクトの属性や関数には「変数名.」であつかうことができます。
 - xとyにランダムな値を入れて、rは0にセットしています。これがオブジェクトの初期値になります。


## オブジェクトを使う

```Java
void draw(){

  background(127);
  sp.drawRect();

}
```

 - spオブジェクトの　drawRect()を呼び出して、Spinnerオブジェクトを描画しています。
 - 実際には SpinnerクラスのdrawRect関数の処理が実行されています。


## オブジェクトを同時にたくさん扱う

```Java
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
```

 - オブジェクトを大量生産して、同時に様々な動きをさせます
 - ArrayListクラスを使って、Spinnerオブジェクトの配列（Array)を作成します
 - ArrayListは、同時にたくさんのオブジェクトを管理する「いれもの」となるオブジェクトです。


## オブジェクトに画像を表示できるようにする

```Java
class Spinner{

  int x;
  int y;
  int r;
  PImage img;

  Spinner(){
    img = loadImage("wheel.png");
  }

///// 中略 /////

  void drawImage(){
    pushMatrix();
    translate(x,y);
    rotate(radians(r));
    fill(255);
    imageMode(CENTER);
    image(img,0,0,100,100);
    popMatrix();
    r++;
  }

}
```

### オブジェクトを作るクラスに画像を属性として追加します
```Java
PImage img;
```
### 関数を追加して、オブジェクトの生成時に画像ファイルを読み込むようにします（コンストラクタといいます）

```Java
Spinner(){
  img = loadImage("wheel.png");
}
```

### 四角のかわりに画像を表示する関数 drawImage を追加します
```Java
void drawImage(){
  pushMatrix();
  translate(x,y);
  rotate(radians(r));
  fill(255);
  imageMode(CENTER);
  image(img,0,0,100,100);
  popMatrix();
  r++;
}
```
### 呼び出すオブジェクトの関数を drawImage に修正します

```Java
void draw(){

  background(127);

  for(int i = 0; i < number; i++){
    spArray.get(i).drawImage();
  }

}
```
