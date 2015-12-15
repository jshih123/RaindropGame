class Catcher{
  float diam;
  PVector loc;
  
  Catcher(float width){
    diam = width;
    loc = new PVector(mouseX, mouseY);
  }
  
  void display(){
    loc = new PVector(mouseX, mouseY);
    ellipse(loc.x, loc.y, diam, diam);
  }
  
}