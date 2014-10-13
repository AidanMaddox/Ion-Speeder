class Fuel {
  float fuelX= random(10, 890);
  float fuelY=0;
  int m=0;
  int q = 1;
  int textX=35;
  void motion() {

    if (playerF>=0) {
      playerF=playerF-.08;
      playerFint = (int)playerF;
    }
  }
  void display() {
    for (int i = 0; i<=playerF; i++) {
      fill(0, 255, 0);
      stroke(0, 255, 0);
      rect(20, 200+(i*2), 10, 10);
    }
  }
  void fuel() {
    ellipse(fuelX, fuelY, 50, 50);
    if (fuelY<600+50) {
      fuelY=fuelY+random(10, 15);
    }
    if (fuelY>600+40 && q == 1) {
      m=millis();
      q = 0;
    }
    if (millis()-m>=10000 && q == 0) {
      fuelY=0;
      fuelX=random(10, 880);
      q = 1;
    }
    if (fuelX>=px-50 && fuelX<=px+50 && playerF>0 && fuelY>=py-50 && fuelY<=py+50) {
      playerF=playerF+10;
      fuelY=650;
    }
    if (fuelX>=px-50 && fuelX<=px+50 && playerF>0 && fuelY>=py-50 && fuelY<=py+50) {
      m=millis();
    }
    if (millis()-m>=10000 && q == 0) {
      fuelY=0;
      fuelX=random(10, 880);
    }
    text(playerFint,textX,250);
    text("%",textX+55,250);
  }
}

