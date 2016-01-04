class Raindrop {
  PVector acc, loc, vel;
  int diam;
  
  Raindrop(PVector pos){
    diam = 25;
    loc = pos;
    vel = new PVector(0, -.2);
    acc = new PVector(0, .1);
  }
  
  void display(){ //display the raindrop
    noStroke();
    colorMode(HSB, width, height, 100);
    fill(loc.x, loc.y, 100); //changes colors based on position
    ellipse(loc.x, loc.y, diam, diam);  
  }
  
  void fall(){ //make the ball move down the screen with an acceleration
    loc.add(vel);
    vel.add(acc);
  }

  boolean isInContactWith(PVector mouse, float buckDiam){ //if raindrop is in contact with mouse
    if (loc.dist(mouse) < diam/2 + buckDiam/2){
      return true;
    }
    else{
      return false;
    }
  }
  
  void reset(){ //reset ball at top
    loc.y = 0;
    loc.x = random(diam, width+diam); //ensures that entire ball is always on screen
    vel.y = -0.1;
  }
  
}