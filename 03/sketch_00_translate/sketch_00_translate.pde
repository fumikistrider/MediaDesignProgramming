size(500,500);
rectMode(CENTER);

pushMatrix();
translate(width/2, height/2); // <- 画面の中心が座標(0,0)に変わる
rect(0,0,200,200);  // <- 座標は(0,0)
popMatrix();
