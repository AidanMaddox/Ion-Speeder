public class Rock {

  float rockSpeed = random(10, 20);
  float rockX = random(3, 888);//location of rock falling
float rockH = random(40, 80);//rock height
 float rockW = rockH;//rock width = the random height
 float rockY =0;
float randomX = random(3, 888);
float image1 = random(1,40);
  float rock=random(1, 4);
  int score=0;

  void display()
  {
imageMode(CENTER);
    if(image1>=1 && image1<=10){
      PImage rock1=loadImage("Rock1.png");
      image(rock1, rockX, rockY, rockH, rockW);
    }
    if(image1>10 && image1<=20){
      PImage rock2=loadImage("Rock2.png");
      image(rock2, rockX, rockY, rockH, rockW);
    }
    if(image1>20 && image1<=30){
      PImage rock3=loadImage("Rock3.png");
      image(rock3, rockX, rockY, rockH, rockW);
    }
    if(image1>30 && image1<=40){
      PImage rock4=loadImage("Rock4.png");
      image(rock4, rockX, rockY, rockH, rockW);
    }
    
  

  }
  void move()
  {

    if (rockY<height+rockH) {
      rockY= rockY + rockSpeed;
    }
    if ((rockY>height+rockH || qw == 1) && q<1000) {
      rockY=0;
      rockX=random(3, 888);
      rockH=random(40, 80);
      rockSpeed = random(10, 20);
      image1 = random(1,40);
      rockW=rockH;
      q=q+1;
      qw = 0;
    }
    if (rockX>=px-(13+rockW/2) && rockX<=px+(13+rockW/2) && playerS>=0 && rockY>=py-(13+rockH/2) && rockY<=py+(13+rockH/2)&& q<1000) {
      playerS=playerS-rockH/3;
      fill(0, 0, 250);
      ellipse(px, py, 150, 150);

      rockY=0;
      rockX=random(3, 888);
      rockH=random(40, 80);
      rockSpeed = random(5, 15);
      rockW=rockH;
      q=q+1;
      qw = 0;
    }

    if (rockX>=px-(13+rockW/2) && rockX<=px+(13+rockW/2) && playerH>=0 && rockY>=py-(13+rockH/2) && rockY<=py+(13+rockH/2)&& playerS<=0 && q<1000) {
      playerH=playerH-rockH/3;
      stroke(255, 0, 0);
      fill(200, 0, 0);
      ellipse(px, py, 150, 150);
      
      rockY=0;
      rockX=random(3, 888);
      rockH=random(40, 80);
      rockSpeed = random(5, 15);
      rockW=rockH;
      q=q+1;
      qw = 0;
    }
  }
}




