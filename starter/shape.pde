PImage img1;

class Shape {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
 
  Shape() {
    img1 = loadImage("shape.png");
    acceleration = PVector.random2D();
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }
 
 void draw() {
  img1.resize(80, 95);
  image(img1, location.x,location.y);
}
  
  // Moving around
  void update() {
    acceleration.mult(0.5);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  // Changing when hit the edges
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}