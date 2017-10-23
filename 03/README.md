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

pushMatrix();
translate(width/2, height/2); // <- 画面の中心が座標(0,0)に変わる
rect(0,0,200,200);  // <- 座標は(0,0)
popMatrix();
```

- 標準では左上にあった原点(0,0)が、translateによって画面の中央に移動しています

```java
size(500,500);
rectMode(CENTER);

pushMatrix();
translate(250,250);
rotate(radians(45));  <- 「度」を「ラジアン」にする
rect(0,0,200,200);
popMatrix();
```

- 画面の真ん中を軸として、画像が回転しているのを確認しましょう。



