class Paddle {
  float x;
  float y;
  float w;
  float h;
  Ball ball;
  int score = 0;
  
  Paddle() {
    x = width/4;
    y = height * .9;
    w = 75;
    h = 15;
    ball = new Ball();
  }
  
  void draw() {
    fill(255);
    rect(x, y, w, h, 0.1, 0.1, 0.1, 0.1);
  }
  
  void update() {
    x = mouseX;
  }
  
  // returns true if the collision happens
  boolean checkForCollision(Ball ball,Paddle paddle){
    //finding the vertical & horizontal distances between the ball’s center and the paddle’s center
    float sideX = Math.abs(ball.position.x - paddle.x-paddle.w/2);
    float sideY = Math.abs(ball.position.y - paddle.y-paddle.h/2);
    // If they are far, distance is greater than both halves
    if (sideX > (paddle.w/2 + ball.radius)) 
    { 
      return false; 
    }
    if (sideY > (paddle.h/2 + ball.radius)) 
    { 
      return false; 
    }
    // If the distance is less than half of paddle they collide
    if (sideX <= (paddle.w/2)) 
    { 
      return true; 
    } 
    if (sideY <= (paddle.h/2)) 
    { 
      return true; 
    }
    // Comparing distance between the centres of the ball and the paddle
    float tempX=sideX-paddle.w/2;
    float tempY=sideY-paddle.h/2;
    return (tempX*tempX+tempY*tempY<=(ball.radius*ball.radius));
  }
}