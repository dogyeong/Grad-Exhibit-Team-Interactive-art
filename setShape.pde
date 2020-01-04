void setShape() {
  shp[0] = loadShape("3D/테두리.obj");
  shp[1] = loadShape("3D/ㄱ.obj");
  shp[2] = loadShape("3D/ㄴ.obj");
  shp[3] = loadShape("3D/ㄷ.obj");
  shp[4] = loadShape("3D/ㄹ.obj");
  shp[5] = loadShape("3D/ㅁ.obj");
  shp[6] = loadShape("3D/ㅂ.obj");
  shp[7] = loadShape("3D/ㅅ.obj");
  shp[8] = loadShape("3D/ㅇ.obj");
  shp[9] = loadShape("3D/ㅈ.obj");
  shp[10] = loadShape("3D/ㅊ.obj");
  shp[11] = loadShape("3D/ㅋ.obj");
  shp[12] = loadShape("3D/ㅌ.obj");
  shp[13] = loadShape("3D/ㅍ.obj");
  shp[14] = loadShape("3D/ㅎ.obj");
  shp[15] = loadShape("3D/ㅏ.obj");
  shp[16] = loadShape("3D/ㅑ.obj");
  shp[17] = loadShape("3D/ㅓ.obj");
  shp[18] = loadShape("3D/ㅕ.obj");
  shp[19] = loadShape("3D/ㅗ.obj");
  shp[20] = loadShape("3D/ㅛ.obj");
  shp[21] = loadShape("3D/ㅜ.obj");
  shp[22] = loadShape("3D/ㅠ.obj");
  shp[23] = loadShape("3D/ㅡ.obj");
  shp[24] = loadShape("3D/ㅣ.obj");
  shp[25] = loadShape("3D/ㅔ.obj");
  shp[26] = loadShape("3D/ㅐ.obj");
  shp[27] = loadShape("3D/ㅟ.obj");
  shp[28] = loadShape("3D/ㅚ.obj");
  shp[29] = loadShape("3D/ㅒ.obj");
  shp[30] = loadShape("3D/ㅖ.obj");
  shp[31] = loadShape("3D/ㅘ.obj");
  shp[32] = loadShape("3D/ㅝ.obj");
  shp[33] = loadShape("3D/ㅙ.obj");
  shp[34] = loadShape("3D/ㅞ.obj");
  shp[35] = loadShape("3D/ㅢ.obj");
  
  for(int i = 0; i< 36; i++) { 
    shp[i].scale(3);
    shp[i].rotateX(PI);
    shp[i].setFill(color(255,255,255,alpha));
    shp[i].setAmbient(0xff7f7f00);
  }
}
