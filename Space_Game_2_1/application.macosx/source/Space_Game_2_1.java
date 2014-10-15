import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import g4p_controls.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Space_Game_2_1 extends PApplet {





//loads the neccisary librarys to run the code


int px=450;//player X
int py=530;//player y value
float playerH=100;//playerH = health
float playerS=100;//playerS=shield
float playerF=100;//player fuel
int playerFint =(int)playerF;//converts the value of an float to an int
float q = 0;//rock counter value
PImage img;
PImage pl;//variable that loads image
int qw = 0;
int qb = 0;
int bx = px;//starting x and y cordinates of bullets
int by = py;
int score=0;//score counter
int level = 0;//level







Minim minim;
AudioPlayer player;//begins the background audio

//The next block of code imports all the occurences of the neccisary classes
Fuel f1=new Fuel();
Rock r1=new Rock();
Rock r2=new Rock();
Rock r3=new Rock();
Rock r4=new Rock();
Rock r5=new Rock();
Rock r6=new Rock();
Rock r7=new Rock();
Rock r8=new Rock();
Rock r9=new Rock();
Rock r10=new Rock();
Rock r11=new Rock();
Rock r12=new Rock();
Rock r13=new Rock();
Rock r14=new Rock();
Rock r15=new Rock();
Rock r16=new Rock();
Health h1=new Health();
Shield s1=new Shield();





float bullet;
public void setup() {
  size(900, 600);//sets background size


  minim = new Minim(this);
  player = minim.loadFile("Turn Down For What (8-Bit NES Remix).mp3");//starts the audio

  player.play();
  frameRate(60);//sets the frame rate(not neccasary)
}

Bullet b1 = new Bullet();

public void draw() {
  PImage is;
  is= loadImage("starry-sky.png");//sets the packground as variable is
 if(level == 5){          //creates a pause function
  background(is);
  textSize(100);
  text("GAME PAUSED",width/2-400,200);
 }
   
if (level == 0){      //game automaticaly starts at level 0 in this case it is the main menue
  
  background(is);
  textSize(75);
  text("Europa",width/2-200,75);
  textSize(45);
  text("Press S To Start",width/2-100,height/2);
}
 if(level == 1){     //if it becomes level 1 then it starts the actual game
  img=loadImage("starry-sky.png");

  background(img);
  //background(50);
 //the next block of code starts the selected classes
  f1.display();
  f1.motion();
  f1.fuel();
  r1.move();
  r1.display();
  r2.move();
  r2.display();
  r3.move();
  r3.display();
  r4.move();
  r4.display();
  r5.move();
  r5.display();
  h1.display();
  s1.display();
  textSize(30);
   text(score,width/2-30,30);
 if (score>30){ //increases the number of rocks on screen when score reaches 30
   r6.display();
   r6.move();
 }
 if(score>60){    //increases # of rocks
   r7.display();
   r7.move();
 }
 if(score>90){ //increases # of rocks
   r8.display();
   r8.move();
 }
 if(score>200){  //increases # of rocks
   r9.display();
    r10.display();
     r11.display();
      r12.display();
      r9.move();
        r10.move();
          r11.move();
            r12.move();
             
 }
 if(score>400){    //increases # of rocks
   r13.display();
   r14.display();
   r15.display();
   r16.display();
  r13.move();
   r14.move();
    r15.move();
     r16.move();
 }

  if (qb==1) {
    b1.move();
    b1.display();
  }
  fill(255, 0, 0);
  textSize(30);
  text("Health", 50, 60);
  fill(0, 0, 255);
  textSize(30);
  text("Shield", 650, 60);
  if (playerH<=0 || playerF<=0) {  //code that allows you top lose
    textSize(50);
    text("GAME OVER", height/2, width/2);
    
  }



  pl=loadImage("ionspeeder.png");  //next amount of code creates your player and all the controls to move it
  imageMode(CENTER);
  image(pl, px, py, 100, 100);
  if (keyPressed && playerH>0 && playerF>0) {
    if (key == 'a' || key=='A') {
      if (px>30) {
        px= px-30;
      }
    }

    if (key =='d'|| key=='D') {
      if (px<870) {
        px= px+30;
      }
    }

    if (key =='w'|| key=='W') {
      if (py>35) {
        py=py-30;
      }
    }

    if (key =='s'||key=='S') {
      if (py<550) {
        py=py+30;
      }
    }
  }
  if (keyPressed) {
    if (key == ' ') {  //shoots a bullet
      qb = 1;
      bx = px;
      by = py;
    }
    if(key=='r'||key=='R'){
      
    }
  }
  }
  if(keyPressed){
    if(key == 'S'||key=='s'){  //game start function
      level=1;
    }
    if(key=='m'||key=='M'){  //main menu function
      level=0;
      playerS=100;
      playerH=100;
      playerF=100;
      score=0;
      q=0;
    }
    if(key=='p'||key=='P'){  //pause
      level=5;
    }
    if(key =='q'||key=='Q'){  //quits the game
      exit();
    }
  }
}

public class Bullet {
  
  public void display() {
    fill(0,100,255);
    stroke(0,100255);
    ellipse(bx-14,by,10,10);
    ellipse(bx+14,by,10,10);
    if(by<=0){
      qb = 0;
    }
  }
  
  public void move() {
    by = by - 30;
  }
}
class Fuel {
  float fuelX= random(10, 890);
  float fuelY=0;
  int m=0;
  int q = 1;
  int textX=35;
  public void motion() {

    if (playerF>=0) {
      playerF=playerF-.08f;
      playerFint = (int)playerF;
    }
  }
  public void display() {
    for (int i = 0; i<=playerF; i++) {
      fill(0, 255, 0);
      stroke(0, 255, 0);
      rect(20, 200+(i*2), 10, 10);
    }
  }
  public void fuel() {
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
    textSize(30);
    text(playerFint,textX,250);
    text("%",textX+55,250);
  }
}

class Health {
  public void display() {
    for (int i = 0; i<=playerH; i++) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      rect(50+(i*2), 10, 2, 10);
    }
  }
}
public class Rock {

  float rockSpeed = random(15, 30);
  float rockX = random(3, 888);//location of rock falling
float rockH = random(40, 80);//rock height
 float rockW = rockH;//rock width = the random height
 float rockY =0;
float randomX = random(3, 888);
float image1 = random(1,40);
  float rock=random(1, 4);
  

  public void display()
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
    
  if (rockY>height+rockH-rockSpeed && playerH>0 && playerF>0){
    score=score+1;
  }

  }
  public void move()
  {

    if (rockY<height+rockH) {
      rockY= rockY + rockSpeed;
    }
    if ((rockY>height+rockH || qw == 1) && q<1000) {
      rockY=0;
      rockX=random(3, 888);
      rockH=random(40, 80);
      rockSpeed = random(15, 30);
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
      rockSpeed = random(15, 30);
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
      rockSpeed = random(15, 30);
      rockW=rockH;
      q=q+1;
      qw = 0;
    }

  }
}




class Shield {
  public void display() {
    for (int i = 0; i<playerS; i++) {
      fill(0, 100, 255);
      stroke(0, 100, 255);
      rect(650+(i*2), 10, 2, 10);
    }
  }
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Space_Game_2_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
