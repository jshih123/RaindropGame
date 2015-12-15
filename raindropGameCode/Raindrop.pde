class Raindrop {
  PVector acc, loc, vel;
  int diam;
  
  Raindrop(PVector pos){
    diam = 50;
    loc = pos;
    vel = new PVector(0, -.15);
    acc = new PVector(0, .05);
  }
  
  void display(){
    noStroke();
    colorMode(HSB, width, height, 100);
    fill(loc.x, loc.y, 100);
    ellipse(loc.x, loc.y, diam, diam);  
  }
  
  void fall(){
    loc.add(vel);
    vel.add(acc);
  }

  boolean isInContactWith(PVector mouse, float buckDiam){
    if (loc.dist(mouse) < diam/2 + buckDiam){
      return true;
    }
    else{
      return false;
    }
  }
  
  void reset(){
    loc.y = 0;
    loc.x = random(0,width);
    vel.y = -0.1;
  }
  
}