PFont mono;

class Headsup {
  int round;
  
  void draw() {
    // draw the game status as a "headsup" display on the gameboard
     mono = loadFont("Charter-Black-48.vlw");
     textFont(mono);
     textSize(16);
     fill(#FFB00F);
     text("Priyanka Grover", width/20, height/18);
     text("Score: "+score,width/20,height/12);
     text("Balls left: "+balls, width/20, height/8.7);
  }
}