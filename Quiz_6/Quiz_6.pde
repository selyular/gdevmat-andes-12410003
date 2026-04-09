void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, 1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2; 
  float y = -(mouseY - Window.windowHeight / 2); 
  return new PVector(x, y); 
}

void draw()
{
  background(130); 
  
  PVector mouse = mousePos();
  
  // normalize and scale length
  mouse.normalize().mult(230); 
  
  // red glow
  stroke(255, 0, 0, 120); 
  strokeWeight(20);
  line(mouse.x * 0.2, mouse.y * 0.2, mouse.x, mouse.y);
  line(-mouse.x * 0.2, -mouse.y * 0.2, -mouse.x, -mouse.y);
  
  // white glow
  stroke(255);
  strokeWeight(10);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // black handle
  stroke(0);
  strokeWeight(15);
  line(-mouse.x * 0.2, -mouse.y * 0.2, mouse.x * 0.2, mouse.y * 0.2);
  
  // magnitude
  println(mouse.mag()); 
}
