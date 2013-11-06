void setup() {
 Serial.begin(9600);
 pinMode(2, INPUT); 
}

void loop() {
 unsigned int val = digitalRead(2);
 Serial.print(val);
 delay(10); 
}
