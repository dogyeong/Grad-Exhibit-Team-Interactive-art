void setLogo() {
  //nameChars, logo
  logo = new PShape[10];
  logo[0] = shp[0];
  for (int i = 0; i < nameLength; i++) {
    for (int j = 1; j <= nameChars.get(i).length(); j++) {
      char c = nameChars.get(i).charAt(j-1);
      if (c == 'ㄱ')
        logo[i * 3 + j] = shp[1];
      else if (c == 'ㄴ')
        logo[i * 3 + j] = shp[2];
      else if (c == 'ㄷ')
        logo[i * 3 + j] = shp[3];
      else if (c == 'ㄹ')
        logo[i * 3 + j] = shp[4];
      else if (c == 'ㅁ')
        logo[i * 3 + j] = shp[5];
      else if (c == 'ㅂ')
        logo[i * 3 + j] = shp[6];
      else if (c == 'ㅅ')
        logo[i * 3 + j] = shp[7];
      else if (c == 'ㅇ')
        logo[i * 3 + j] = shp[8];
      else if (c == 'ㅈ')
        logo[i * 3 + j] = shp[9];
      else if (c == 'ㅊ')
        logo[i * 3 + j] = shp[10];
      else if (c == 'ㅋ')
        logo[i * 3 + j] = shp[11];
      else if (c == 'ㅌ')
        logo[i * 3 + j] = shp[12];
      else if (c == 'ㅍ')
        logo[i * 3 + j] = shp[13];
      else if (c == 'ㅎ')
        logo[i * 3 + j] = shp[14];
      else if (c == 'ㅏ')
        logo[i * 3 + j] = shp[15];
      else if (c == 'ㅑ')
        logo[i * 3 + j] = shp[16];
      else if (c == 'ㅓ')
        logo[i * 3 + j] = shp[17];
      else if (c == 'ㅕ')
        logo[i * 3 + j] = shp[18];
      else if (c == 'ㅗ')
        logo[i * 3 + j] = shp[19];
      else if (c == 'ㅛ')
        logo[i * 3 + j] = shp[20];
      else if (c == 'ㅜ')
        logo[i * 3 + j] = shp[21];
      else if (c == 'ㅠ')
        logo[i * 3 + j] = shp[22];
      else if (c == 'ㅡ')
        logo[i * 3 + j] = shp[23];
      else if (c == 'ㅣ')
        logo[i * 3 + j] = shp[24];
      else if (c == 'ㅔ')
        logo[i * 3 + j] = shp[25];
      else if (c == 'ㅐ')
        logo[i * 3 + j] = shp[26];
      else if (c == 'ㅟ')
        logo[i * 3 + j] = shp[27];
      else if (c == 'ㅚ')
        logo[i * 3 + j] = shp[28];
      else if (c == 'ㅒ')
        logo[i * 3 + j] = shp[29];
      else if (c == 'ㅖ')
        logo[i * 3 + j] = shp[30];
      else if (c == 'ㅘ')
        logo[i * 3 + j] = shp[31];
      else if (c == 'ㅝ')
        logo[i * 3 + j] = shp[32];
      else if (c == 'ㅙ')
        logo[i * 3 + j] = shp[33];
      else if (c == 'ㅞ')
        logo[i * 3 + j] = shp[34];
      else
        logo[i * 3 + j] = shp[35];
    }
  }
  logo_dst = new ArrayList<PVector>();
  logo_dst.add(new PVector(0,0));
  for(int i = 1; i < logo.length; i++) logo_dst.add(new PVector(-75 + (i+2)%3*75, -75 + (i-1)/3*75, 0));
}
