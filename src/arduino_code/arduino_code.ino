void setup() {
 Serial.begin(9600);
 pinMode(2, INPUT); 
}

void loop() {

  int count = 0;
  
  while(1) {
    unsigned int val = digitalRead(2);
    Serial.print(val);
    count++;
    if (count == 80) {
      Serial.print("\n");
      count = 0;
    }
    delay(10);
 }
 
}
