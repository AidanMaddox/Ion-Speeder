class Fuel {
  
  void motion(){
    
    if (playerF>=0){
     playerF=playerF-.1;
 }
  }
  void display() {
    for (int i = 0; i<=playerF; i++) {
      fill(0, 255, 0);
      stroke(0,255, 0);
      rect(20, 300+(i*2), 10, 10);
    }
  }
}

