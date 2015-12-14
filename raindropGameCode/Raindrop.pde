class Raindrop {
  PVector acc, loc, vel;
  int diam;
  
  Raindrop(PVector pos){
    diam = 50;
    loc = pos;
    vel = new PVector(0, -.1);
    acc = new PVector(0, .05);
  }
  
  void display(){
    noStroke();
    colorMode(HSB, width, height, 100);
    fill(loc.x, loc.y, 100);
    ellipse(loc.x, loc.y, diam, diam);  
  }
  
  void fall(){
    loc.x += vel.x;
    loc.y += vel.y;
    
    vel.x += acc.x;
    vel.y += acc.y;
  }

  boolean isInContactWith(PVector mouse){
    if (loc.dist(mouse) < diam/2){
      return true;
    }
    else{
      return false;
    }
  }
  
  void reset(){
    loc.y = 0;
  }
  
}