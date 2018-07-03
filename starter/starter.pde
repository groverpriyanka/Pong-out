// Pong Game
// Starter Code
import java.util.*;
import processing.sound.*;
SoundFile file;
PImage img;

Ball ball;
Paddle paddle;
Headsup hup;
Shape[] shapes = new Shape[3];
int score;
int balls;

void setup() {
  //Setting up canvas
  size(300, 600);
  //Loading background image
  img = loadImage("pingpongBalls.jpg");
  hup = new Headsup();
  paddle = new Paddle();
  ball = new Ball();
  score = 0;
  balls = 3;
  for (int i = 0; i < shapes.length; i++) {
    shapes[i] = new Shape();
  }
}

void draw() {
  background(0);
  image(img,0,100);
  ball.update();
  paddle.update();
  ball.draw();
  hup.draw();
  paddle.draw();
  collisionStatus();
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].update();
    shapes[i].checkEdges();
    shapes[i].draw();
  }
}

//Checkifor paddle and ball collision status
void collisionStatus(){
    if(paddle.checkForCollision(ball,paddle)){
      file = new SoundFile(this, "pong.mp3");
      file.play();
      ball.velocity.y = -1 * ball.velocity.y;
      score++;
  }
}