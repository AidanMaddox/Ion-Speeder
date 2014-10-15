public class Bullet {
  
  void display() {
    fill(0,100,255);
    stroke(0,100255);
    ellipse(bx-14,by,10,10);
    ellipse(bx+14,by,10,10);
    if(by<=0){
      qb = 0;
    }
  }
  
  void move() {
    by = by - 30;
  }
}
