import processing.sound.*;
SoundFile file1;
SoundFile file2;

class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius;
  float topspeed;
  
  Ball() {
    position = new PVector(0, 0);
    velocity = new PVector(4.5,5);
    radius = 25;
    topspeed = 10;
  }
  
  void add(PVector v) {
    position.y = position.y + v.y;
    position.x = position.x + v.x;
  }

  void update() {
    // compute where ball is next
    if(balls == 0){
      file1 = new SoundFile(starter.this, "lostball.mp3");
      file1.play();
      gameOver();
    }
    else {
      position.add(velocity);
      if ((position.x > width) || (position.x < 0)) {
      velocity.x = velocity.x * -1;
      } 
      if(position.y < 0) {
      velocity.y = velocity.y * -1;
      }
      if (position.y > height){
      // Decreasing balls if it goes out of height
      balls--;
      file2 = new SoundFile(starter.this, "lostball.mp3");
      file2.play();
      // Resetting new ball
      this.position.y = random(50);
      }
    }
   }
  
  void draw() {
    fill(#F50C0C);
    ellipse(position.x, position.y, radius, radius);
  }
  
  void gameOver(){
     fill(255, 0, 0);
     textSize(32);
     mono = loadFont("Trattatello-48.vlw");
     textFont(mono);
     text("Game Over!", 50, height/3);
     position.x = width*2;
     position.y = height*2;
 }
}