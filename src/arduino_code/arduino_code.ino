void setup() {
 Serial.begin(115200);
 pinMode(2, INPUT); 
}

void loop() {
//  byte randomByte;
  byte randomByte = digitalRead(2) | (digitalRead(2)<<1) | 
  (digitalRead(2)<<2) | (digitalRead(2)<<3) | (digitalRead(2)<<4) |
  (digitalRead(2)<<5) | (digitalRead(2)<<6) | (digitalRead(2)<<7);

//  randomByte = 56;

  Serial.write(randomByte);

//  randomByte = 55;
  
//  Serial.write(randomByte);

//  delay(10);
 
}
