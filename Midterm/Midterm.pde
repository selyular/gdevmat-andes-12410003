Walker blackHole; 
Walker[] walkers;

int walkerNumber = 120;
int resetFrames = 600; 

void spawnBlackHole()
{
  blackHole.position.x = random(-width/2, width/2);
  blackHole.position.y = random(-height/2, height/2);
  blackHole.scale = 50;
}

void spawnMatter(Walker w)
{
  float x = (float) randomGaussian() * (width / 6);
  float y = (float) randomGaussian() * (height / 6);
  
  w.position = new PVector(x, y);
  
  w.scale = random(5, 20);
  
  w.r = random(255);
  w.g = random(255);
  w.b = random(255);
}

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, 1, 0); 
  
  blackHole = new Walker();
  spawnBlackHole();
  
  walkers = new Walker[walkerNumber];
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    spawnMatter(walkers[i]);
  }
}

void draw()
{
  background(130);
  
  fill(255);
  blackHole.render();
  
  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];
    
    PVector dir = PVector.sub(blackHole.position, w.position);
    dir.normalize();
    dir.mult(2); 
    
    w.position.add(dir);
    w.render();
  }
  
  if (frameCount % resetFrames == 0)
  {
    spawnBlackHole();
    
    for (int i = 0; i < walkers.length; i++)
    {
      spawnMatter(walkers[i]);
    }
  }
}
