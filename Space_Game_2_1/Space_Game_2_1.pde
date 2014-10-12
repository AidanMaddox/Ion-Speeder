import g4p_controls.*;

import ddf.minim.*;
import g4p_controls.*;


int px=450;//player X
int py=530;
float playerH=100;//playerH = health
float playerS=100;//playerS=shield
float playerF=50;
float q = 0;
PImage img;
PImage pl;
int qw = 0;
int qb = 0;
int bx = px;
int by = py;


Minim minim;
AudioPlayer player;
//Fuel f1=new Fuel();
Rock r1=new Rock();
Rock r2=new Rock();
Rock r3=new Rock();
Rock r4=new Rock();
Health h1=new Health();
Shield s1=new Shield();


float bullet;
void setup() {
  size(900, 600);

  minim = new Minim(this);
  player = minim.loadFile("Turn Down For What (8-Bit NES Remix).mp3");

  player.play();
  frameRate(60);
}

Bullet b1 = new Bullet();

void draw() {

  img=loadImage("starry-sky.png");

  background(img);
  //background(50);
  //f1.display();
  //f1.motion();
  r1.move();
  r1.display();
  r2.move();
  r2.display();
  r3.move();
  r3.display();
  r4.move();
  r4.display();
  h1.display();
  s1.display();
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
  if (playerH<=0 || playerF<=0) {
    textSize(50);
    text("GAME OVER", height/2, width/2);
    
  }




  pl=loadImage("ionspeeder.png");
  imageMode(CENTER);
  image(pl, px, py, 100, 100);
  if (keyPressed && playerH>0 && playerF>0) {
    if (key == 'a' || key=='A'||key=="LEFT") {
      if (px>30) {
        px= px-20;
      }
    }

    if (key =='d'|| key=='D'||key=="RIGHT") {
      if (px<870) {
        px= px+20;
      }
    }

    if (key =='w'|| key=='W'||key=="RIGHT") {
      if (py>35) {
        py=py-20;
      }
    }

    if (key =='s'||key=='S'||key=="DOWN") {
      if (py<550) {
        py=py+20;
      }
    }
  }
  if (keyPressed) {
    if (key == ' ') {
      qb = 1;
      bx = px;
      by = py;
    }
    if(key=='r'||key=='R'){
      
    }
  }
}

