class Raindrop {
  PVector acc, loc, vel;
  int diam;
  
  Raindrop(PVector pos){
    diam = 20;
    acc = new PVector(-1.1, 0);
    loc = pos;
    vel = new PVector(-2, 0);
  }
  
  void display(){
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);  
  }
  
  void fall(){
    
  }

}