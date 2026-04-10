int ballCount = 10;

Walker[] walkers = new Walker[ballCount];  
PVector wind = new PVector(0.1, 0);


void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 

  println(Window.windowHeight);

  for (int i = 0; i < walkers.length; i++) 
  {

    walkers[i] = new Walker();
    walkers[i].mass = random(2, 10);                     
    walkers[i].scale = walkers[i].mass * 12;    
    walkers[i].position.set(random(-250, 250), random(-250, 250));
    walkers[i].col = color(random(255), random(255), random(255), 100);
  }
}


void draw() 
{
  background(255);

  
  for (Walker w : walkers) 
  {
    
    w.render();
    w.update();
    
    for (int i = 0; i < walkers.length; i++) 
    {
      Walker otherWalker = walkers[i];
      if (w != otherWalker)
      {
        w.applyForce(otherWalker.calculateAttraction(w));
      }
      
    }
   
  }
}
