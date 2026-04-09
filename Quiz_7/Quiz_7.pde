Walker[] walkers = new Walker[100];

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, 1, 0); 
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    walkers[i].scale = random(10, 50);  // random scale
  }
}

PVector mousePos() 
{
  float x = mouseX - Window.windowWidth / 2; 
  float y = -(mouseY - Window.windowHeight / 2); 
  return new PVector(x, y); 
}

void draw() 
{
  background(80);
  
  PVector target = mousePos();  
  
  for (Walker w : walkers) 
  {
    // Calculate direction to mouse
    PVector dir = PVector.sub(target, w.position); 
    dir.normalize();  
    dir.mult(0.2);    
    w.acceleration = dir;
    
    w.update();
    w.render();
    w.checkEdges();
  }
}
