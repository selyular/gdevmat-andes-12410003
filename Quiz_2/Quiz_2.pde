Walker normalWalker;
Walker biasedWalker;

void setup()
{
  size(1020, 720); 
  // camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); 
  
  normalWalker = new Walker();
  normalWalker.x = width/2;
  normalWalker.y = height/2;
  
  biasedWalker = new Walker();
  biasedWalker.x = width/2;
  biasedWalker.y = height/2;
}

void draw() 
{ 
  background(255);
  
  // normal walker
  normalWalker.randomWalk();
  normalWalker.render();
  
  // biased walker
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
}
