void setup() {
 Serial.begin(9600);
 pinMode(2, INPUT); 
}

void loop() {

  byte randomByte = digitalRead(2) | (digitalRead(2)<<1) | 
  (digitalRead(2)<<2) | (digitalRead(2)<<3) | (digitalRead(2)<<4) |
  (digitalRead(2)<<5) | (digitalRead(2)<<6) | (digitalRead(2)<<7);

  Serial.write(randomByte);

  delay(10);
 
}
