


import ddf.minim.*;
import g4p_controls.*;//loads the neccisary librarys to run the code


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
void setup() {
  size(900, 600);//sets background size


  minim = new Minim(this);
  player = minim.loadFile("Turn Down For What (8-Bit NES Remix).mp3");//starts the audio

  player.play();
  frameRate(60);//sets the frame rate(not neccasary)
}

Bullet b1 = new Bullet();

void draw() {
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

