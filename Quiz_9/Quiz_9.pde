int ballCount = 8;

Walker[] walkers = new Walker[ballCount];  
PVector acceleration = new PVector(0.2, 0);

void setBalls()
{
  for (int i = 0; i < walkers.length; i++) 
  {
    float posY = 2 * (Window.windowHeight / ballCount) * (i + 0.5 - (ballCount / 2)); //((i + 1) * 10 * ballCount) + Window.bottom;
    
    walkers[i] = new Walker();
    walkers[i].mass = i + 1;                     
    walkers[i].scale = walkers[i].mass * 12;    
    walkers[i].position.set(Window.left + 100 , posY);
    walkers[i].col = color(random(255), random(255), random(255));
  }
}

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, -Window.eyeZ, 0, 0, 0, 0, 1, 0); 

  println(Window.windowHeight);

  setBalls();
}

void draw() 
{
  background(255);
  
  strokeWeight(2);
  fill(0, 0, 0);
  stroke(0, 0, 0, 100);
  line(0, -Window.windowHeight, 0, Window.windowHeight);

  for (Walker w : walkers) 
  {
    w.applyForce(acceleration);
    
    float mew = 0.01f; 
    if (0 < w.position.x)
    {
      mew = 0.4f; 
    }
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    w.update();
    w.checkEdges();
    w.render();
  }
}

void mouseClicked() 
{
  setBalls();
}
