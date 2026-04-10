int ballCount = 10;

Walker[] walkers = new Walker[ballCount];  
PVector wind = new PVector(0.1, 0);


void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 

  println(Window.windowHeight);

  setBalls();
}

Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void draw() 
{
  background(255);
  
  ocean.render();

  for (Walker w : walkers) 
  {
    
    w.applyForce(wind);
    
    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= 1;
    }
    
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
    
    float mew = 0.1f;
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1).normalize().mult(frictionMagnitude);
    w.applyForce(friction);
    
    w.render();
    w.update();
    w.checkEdges();
  }
}

void setBalls()
{
  for (int i = 0; i < walkers.length; i++) 
  {
    float posX = (2 * (Window.windowWidth / ballCount) * (i+0.5)) - Window.right;
    
    walkers[i] = new Walker();
    walkers[i].mass = random(2, 10);                     
    walkers[i].scale = walkers[i].mass * 12;    
    walkers[i].position.set(posX , 200);
    walkers[i].col = color(random(255), random(255), random(255));
  }
}

void mouseClicked() 
{
  setBalls();
}
