void setup() {
 Serial.begin(9600);
 pinMode(2, INPUT); 
}

void loop() {

  int count = 0;
  int buffer[32];
  int i = 0;
  int j = 0;
  
  for(i ; i < 32 ; i++) {
    unsigned int val = digitalRead(2);
    buffer[i] = val;
  }
  for(j ; j < 32 ; j++) {
    Serial.print(buffer[j]);
  }
  
  Serial.print("\n");
    
  delay(10);
 
}
