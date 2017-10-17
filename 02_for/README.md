# ループのつくりかた

## for を使った繰り返し

```Java
for ( int i = 0; i < 100; i++ ) {
  // 繰り返す処理を書きます
  // 100回　繰り返されます
}
```

- for( 変数の宣言 ; ループの継続する条件; 変数の更新 )

## while と for の比較

- whileを使った場合
```Java
size(800,600);
smooth();
background(255);

int x = 0;

while( x < width ){
  stroke(random(255), random(255), random(255));
  line(x, 0, x, height);
  x++;
}
```

- 同じものをforを使った場合
```Java
size(800,600);
smooth();
background(255);

for( int x = 0; x < width; x++){
  stroke(random(255), random(255), random(255));
  line(x, 0, x, height);  
}
```

違いを見比べてみよう

## 変数の有効範囲

```Java
int y = 200;   // 変数 y はどこでも有効です

for( int x = 0; x < 400; x += 5 ){
  // 変数 x は、 forの{ から } の間で有効です

  ellipse( x, y, 50, 50);  // 正しく動作します
}

ellipse( x, y, 50, 50); // 変数 x が有効でないのでエラーになります

```

- 変数を有効な範囲以外で使おうとすると、プログラムがエラーとなります

## ２重ループのつくりかた

for文の中に、さらに for文を入れることができます。

```Java
for( int x = 0; x < width; x+=50 ){ // 一つ目のループです

  for( int y = 0; y < height;  y+=50){ // 二つ目のループです

    ellipse(x, y, 50, 50);

  }

}
```

- xのループが繰り返されているあいだ、yのループも繰り返し実行されます。

### (実験) カラーモードをループと組み合わせる

色を指定する変数をループにすると、徐々に変化する色を生成することができます。

```Java
size(256, 256);

for(int r = 0; r <= 255; r++){
    stroke(r, 0, 0);
    line( r, 0, r, 255);
}
```

colorMode() を使って、色の範囲を設定できます。

```Java
colorMode( HSB, 100, 100, 100);
```

色の指定には "RGB" と "HSB"があります。
値の範囲も変更することができます。
初期は0 - 255 の範囲になっています。

#### HSB
- H (色相)
- S (彩度)
- b (明度)

#### RGB
- R (赤)
- G (緑)
- B (青)

#### ループ範囲と色の指定範囲をつかってグラデーションをあわせる

colorModeの値に width , height を使って、画面の端から端までを
グラデーション範囲に併せてみます。

```Java
size(800,600);
background(0);
noStroke();

colorMode(HSB, width, height, 100);

for( int x = 0; x <= width; x += 25){
  for(int y = 0; y <= height; y += 25){

    fill(x, y, 100);
    rect(x, y, 25, 25);

  }
}
```
