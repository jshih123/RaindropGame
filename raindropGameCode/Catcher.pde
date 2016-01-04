class Catcher{
  float diam;
  PVector loc;
  
  Catcher(float width){ //declare catcher
    diam = width;
    loc = new PVector(mouseX, mouseY);
  }
  
  void display(){ //display the catcher
    loc = new PVector(mouseX, mouseY);
    fill(loc.x, loc.y, 100); //fill based on position
    ellipse(loc.x, loc.y, diam, diam);
  }
  
}