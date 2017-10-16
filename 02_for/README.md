# ループのつくりかた

## for を使った繰り返し

```Java
for ( int i = 0; i < max; i++ ) { 
  // 繰り返す処理を書きます
}
```

## 変数の有効範囲

```Java
int y = 200;   // 変数 y はどこでも有効です

for( int x = 0; x < 400; x += 5 ){
  // 変数 x は、 forの{ から } の間で有効です
  
  ellipse( x, y, 50, 50);  // 正しく動作します
}

ellipse( x, y, 50, 50); // 変数 x が有効でないのでエラーになります

```

## ２重ループのつくりかた

for文の中に、さらに for文を入れることができます。

```Java
for( int x = 0; x < width; x+=50 ){ // 一つ目のループです

  for( int y = 0; y < height;  y+=50){ // 二つ目のループです

    ellipse(x, y, 50, 50);
    
  }
  
}
```

### (実験) カラーモードをループと組み合わせる

色を指定する変数をループにすると、徐々に変化する色を生成することができます。

```Java
for( int r = 0; r <= 255; r++ ){
  for( int g = 0; g <= 255; g++ ){
    fill( r, g, 0);
  }
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



