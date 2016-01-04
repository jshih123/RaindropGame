class Catcher{
  float diam;
  PVector loc;
  
  Catcher(float width){
    diam = width;
    loc = new PVector(mouseX, mouseY);

  }
  
  void display(){
    loc = new PVector(mouseX, mouseY);
    fill(loc.x, loc.y, 100);
    ellipse(loc.x, loc.y, diam, diam);
  }
  
}