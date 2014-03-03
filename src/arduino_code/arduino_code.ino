void setup() {
 Serial.begin(115200);
 pinMode(2, INPUT); 
}

void loop() {

  byte randomByte;
  int shift = 0;

  //while randomByte isn't filled with debiased bits...
  while ( shift < 8) {

    //Start Von Neumann debiasing routine. Sample two bits.
    byte randOne = digitalRead(2) & 0x01;
    byte randTwo = digitalRead(2) & 0x01;

    //Bits were same value. discard.
    if (randOne == randTwo) {
      continue;
    }
    //went from one to zero. Write one.
    else if (randOne > randTwo) {
      randomByte = randomByte | (randOne<<shift);
      shift++;
    }
    //went from zero to one. Write zero.
    else if (randTwo > randOne) {
      randomByte = randomByte | (randOne<<shift);
      shift++;
    }
    //If randomByte is filled, write it out to serial.
    if ( shift == 7 ) {
      Serial.write(randomByte);
    }
    //else, keep going.
    else {
      continue;
    }

  } //end while; a full, debiased byte has been written.

//  randomByte = 56;

//  Serial.write(randomByte);

//  randomByte = 55;
  
//  Serial.write(randomByte);

//  delay(10);
 
}
