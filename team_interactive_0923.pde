//import geomerative.*;
import java.util.*;

String filename;
String fileURL;
String strToDraw;
File f;
int n, ranNum, ment, nameChangeCount, currentNameNum, alphaCount, offset;
float count, prevCount;
String[] originalName = {"",};
PShape shp[], logo[];
PShape s;
PFont NanumFont;
int x, y, r, nameLength, alpha, step;
ArrayList<String> nameChars;
ArrayList<PVector> logo_dst;
ArrayList<PVector> logo_xyz;
ArrayList<PVector> logo_angle;
Queue queue;


void setup() {
  size(1500,1000,P3D);
  //fullScreen(P3D);
  colorMode(RGB, 255, 255, 255, 100);
  ortho();
  //set variable
  x = width/2;
  y = 200;
  r = 500;
  alpha = 100;
  step = -1;
  offset = 30;
  count = nameChangeCount = alphaCount = 0;
  ranNum = (int)(Math.random()*10)+1;
  //set font
  NanumFont = createFont("NanumBarunGothic.ttf", 32);
  textFont(NanumFont);
  textSize(48);
  textAlign(CENTER, CENTER);
  fill(255);
  
  //initialize local file setting
  n = 1;
  filename = "data" + n + ".txt";
  f = new File(dataPath(filename));
  while(f.exists()) {
    n++;
    currentNameNum = n-1;
    filename = "data" + n + ".txt";
    f = new File(dataPath(filename));
  }
  println(n);
  currentNameNum = n-1;
  nameChars = new ArrayList<String>();
  logo_dst = new ArrayList<PVector>();
  logo_xyz = new ArrayList<PVector>();
  logo_angle = new ArrayList<PVector>();
  queue = new LinkedList();
  
  shp = new PShape[36];
  setShape();
  //shp.setTexture(); 
  frameRate(30);
  rotateY(PI);
}

void draw() {
  background(0);
  
  lights();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
 
  //새 파일이 만들어졌을 때, 큐 또는 originalName에 그 이름을 String으로 넣는다
  if(f.exists()) {
    readFile();
  }
  
  //앞의 다른 이름로고가 충분히 디스플레이 되고 큐에 이름이 있을 때, 다음 이름을 originalName에 넣고 step을 0으로 바꿔서 시작한다.
  if(step == 3) {
    if(frameCount - prevCount > 200 && !queue.isEmpty()) {
      originalName = (String[])queue.poll();
      println(originalName[0]);
      ranNum = (int)(Math.random()*10)+1;
      nameChangeCount = 0;
      step = 0;
    }
    else if(nameChangeCount > 200) {
      step = 4; 
      nameChangeCount = 0;
    }
    nameChangeCount++;
  }
  
  if(step == 4) {
    if(alpha == 0) {
      nameChange();
    }
    else if(alpha > 100) {
      step = 3;
      alphaCount = 0;
      alpha = 100;
    }
    alpha = abs(-alphaCount + 100);
    for(int i =0; i<logo.length; i++) {
      if(logo[i] != null) {
        logo[i].setFill(color(255,255,255,alpha));
      }
    }
    alphaCount++;
    println("alpha : " + alpha);
  }
  
  // nameLength : 2~3 
  // nameChars  : "dlehrud" -> "d l", "e h", "r u d"
  if(step == 0) {
    devideName();
    setLogo(); //name determines the shape of logo
    spawnLogo(); //set the initial position of logo
    strToDraw = "반갑습니다, " + originalName[0] + "님.\n " + (n-1) + "번째 관람객입니다.";
    ment = 1;
    step = 1;
  }
  
  if(step == 1) {
    drawText();
    if (alpha <0) {
      step = 2;
      alpha = 100;
      prevCount = frameCount;
      count = 0;
    }
  }
  
  if (step == 2) { 
    callDrawName();
    count++;
    if(count > 200) {
      step++;
      prevCount = frameCount;
    }
  }
  
  if(step == 3 || step == 4) {
    callDrawName();
  }
  drawLine();
}

void drawName() {
  for(int i =0; i<logo.length; i++) {
    if(logo[i] != null) {
      if(step == 2) {
        float x = lerp(logo_xyz.get(i).x, logo_dst.get(i).x, count/200);
        float y  = lerp(logo_xyz.get(i).y, logo_dst.get(i).y, count/200);
        float z = lerp(logo_xyz.get(i).z, logo_dst.get(i).z, count/200);
        //float x = logo_dst.get(i)r.x;
        //float y = logo_dst.get(i).y;
        float a_x = lerp(logo_angle.get(i).x, 0, count/200);
        float a_y = lerp(logo_angle.get(i).y, 0, count/200);
        float a_z = lerp(logo_angle.get(i).z, 0, count/200);
        pushMatrix();
        translate(x, y, z);
        logo[i].rotateX(a_x);
        logo[i].rotateY(a_y);
        logo[i].rotateZ(a_z);
        shape(logo[i], 0, 0);
        logo[i].rotateZ(-a_z);
        logo[i].rotateY(-a_y);
        logo[i].rotateX(-a_x);
        popMatrix();  
      }
      else if(step == 3 || step == 4) {
        float x = logo_dst.get(i).x;
        float y = logo_dst.get(i).y + sin((frameCount-prevCount)*0.1)*10;
        pushMatrix();
        rotateY((frameCount-prevCount)*0.01);
        shape(logo[i], x, y);
        popMatrix();
      }
    }
  }   
}


void drawLine() {
  pushStyle();
  fill(255);
  stroke(255);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  popStyle();  
}

void spawnLogo() {
  logo_xyz = new ArrayList<PVector>();
  logo_angle = new ArrayList<PVector>();
  for(int i = 0; i < logo_dst.size(); i++) {
    logo_xyz.add(new PVector(random(-250,250), random(400,700), random(-250,250)));
    logo_angle.add(new PVector(random(-TWO_PI, TWO_PI),random(-TWO_PI, TWO_PI),random(-TWO_PI, TWO_PI)));
  }
}

void readFile() {
  if (step == -1) {
    originalName = loadStrings(filename);
    step = 0;
  }
  else
    queue.offer(loadStrings(filename));
  n++;
  currentNameNum = n-1;
  filename = "data" + n + ".txt";
  f = new File(dataPath(filename));  
}

void devideName() {
  nameLength = originalName[0].length();
  if(nameLength > 3) nameLength = 3;
  
  nameChars = new ArrayList<String>();
  for(int i = 0; i < nameLength; i++) {
    nameChars.add(String.valueOf(originalName[0].charAt(i)));  
  }
  
  for(int i = 0; i < nameLength; i++) {
    nameChars.set(i,toKoJaso(nameChars.get(i)));
  }
  for(String s : nameChars) println(s);
}

void callDrawName() {
  pushMatrix();
  translate(x, y+r, 0);
  //rotateY(frameCount*0.01);
  rotateY(PI);
  drawName();
  popMatrix();
  
  pushMatrix();
  translate(x-r-offset-30, y+offset, 0);
  rotateZ(PI/2);
  //rotateY(frameCount*0.01);
  rotateY(-PI/2);
  drawName();
  popMatrix();
  
  pushMatrix();
  translate(x+r+offset+30, y+offset, 0);
  rotateZ(-PI/2);
  //rotateY(frameCount*0.01);
  rotateY(PI/2);
  drawName();
  popMatrix();
}

void drawText() { //n:number //originalName[0]:name
  fill(255,255,255,alpha);
  drawDev(strToDraw);
  if(ranNum == 1) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "난 알아요. 이런 이름 알아요.";
      ment++;
      alpha = 101;
    }
  }
  else if(ranNum == 2) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "이름은 인생의 세줄 요약이라고 합니다.";
      alpha = 101;
      ment++;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "당신의 이름으로 당신의 인생을 잠시 엿본 것 같네요.";
      alpha = 101;
      ment++;
    }
  }
  else if(ranNum == 3) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "이름에서 향기가 나네요.";
      ment++;
      alpha = 101;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "혹시 '" + originalName[0] + "'이란 꽃도 있나요?";
      alpha = 101;
      ment++;
    }
  }
  else if(ranNum == 4) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "당신의 이름은 어디에서 왔나요?";
      ment++;
      alpha = 101;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "제 이름은 영국에서 최초로 시작되어 일년에 한바퀴씩...";
      alpha = 101;
      ment++;
    }
  }
  else if(ranNum == 5) {
    if(ment == 1 && alpha == 0) {
      strToDraw = originalName[0] + " 마음속에 로그인!";
      alpha = 101;
      ment++;
    }
  }
  else if(ranNum == 6) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "사람은 이름을 따라간다던데..";
      ment++;
      alpha = 101;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "당신은 어디를 향해 가고 있나요?";
      alpha = 101;
      ment++;
    }
  }
  else if(ranNum == 7) {
    if(ment == 1 && alpha == 0) {
      strToDraw = originalName[0] + "...";
      alpha = 101;
      ment++;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "어떤 의미를 가지고 있나요?";
      alpha = 101;
      ment++;  
    }
  }
  else if(ranNum == 8) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "요즘같은 날씨에 잘 어울리는 이름이네요.";
      alpha = 101;
      ment++;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "혹시 가을에 태어나셨나요?";
      alpha = 101;
      ment++;
    }
  }
  else if(ranNum == 9) {
    if(ment == 1 && alpha == 0) {
      strToDraw = "보면 기분이 좋아지는 이름이네요.";
      alpha = 101;
      ment++;
    }
    if(ment == 2 && alpha == 0) {
      strToDraw = "오늘 " + originalName[0] + "님의 기분은 어떤가요?";
      alpha = 101;
      ment++;
    }
  }
  else {
    if(ment == 1 && alpha == 0) {
      strToDraw = "재미있는 것 보여드릴까요?";
      alpha = 101;
      ment++;
    }
  }
  alpha -= 1;
}

void drawDev(String s) {
  pushMatrix();
  translate(x, y+r, 0);
  rotateY(PI);
  rotateY(frameCount*0.01);
  text(s, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(x-r-offset-30, y+offset, 0);
  rotateZ(PI/2);
  rotateY(-PI/2);
  rotateY(frameCount*0.01);
  text(s, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(x+r+offset+30, y+offset, 0);
  rotateZ(-PI/2);
  rotateY(PI/2);
  rotateY(frameCount*0.01);
  text(s, 0, 0);
  popMatrix();
}

void nameChange() {
  int temp = (int)random(1, n-1);
  while(currentNameNum == temp) temp = (int)random(1, n-1);
  originalName = loadStrings("data" + temp + ".txt");
  devideName();
  setLogo();
}
