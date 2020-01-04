#define trigPin1 13
#define echoPin1 12
#define trigPin2 11
#define echoPin2 10
#define trigPin3 9
#define echoPin3 8
#define trigPin4 7
#define echoPin4 6
#define trigPin5 5
#define echoPin5 4

void setup()
{
  Serial.begin (9600);
  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin1, INPUT);
  pinMode(trigPin2, OUTPUT);
  pinMode(echoPin2, INPUT);
  pinMode(trigPin3, OUTPUT);
  pinMode(echoPin3, INPUT);
  pinMode(trigPin4, OUTPUT);
  pinMode(echoPin4, INPUT);
  pinMode(trigPin5, OUTPUT);
  pinMode(echoPin5, INPUT);
}

void loop()
{
  int duration, distance = 99999;  // 시간, 거리
  int min = 0;  // 최솟값
  int a[4];

  for (int i = 1; i < 6; i++) {
    digitalWrite(2 * i + 3, HIGH);
    delayMicroseconds(10);      // trigPin을 10마이크로초 동안 HIGH
    digitalWrite(2 * i + 3, LOW);
    duration = pulseIn(2 * i + 2, HIGH);
    distance = (duration / 2) / 29.1;
    //   // 시간
    //      a[i] = duration;
    //거리
    a[i] = distance;
    Serial.print( "DURATION ");
    Serial.print(i);
    Serial.print(" : ");
    Serial.print(a[i]);
    Serial.print("     ");
  }

  //// 최솟값
  //min = (duration / 2) / 29.1 < distance  ?  (duration / 2)  /  29.1 : distance ;
  //
  Serial.println();
  Serial.println();
  Serial.println();
  Serial.println();
  //  Serial.print( "DISTANCE : ");
  //  Serial.println(distance);
  //    Serial.println(distance);
  //    Serial.println("—————————————————————");


  delay(4000);
}
