void setup() 
{
  size(1020, 720); 
  background(0); 
}

void draw()
{
  float meanX = width / 2;
  float stdDevX = 150;
  float x = randomGaussian() * stdDevX + meanX;
  
  float y = random(height);
  
  float meanSize = 30;
  float stdDevSize = 15;
  float s = abs(randomGaussian() * stdDevSize + meanSize);
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);
  
  noStroke();
  fill(r, g, b, a);
  
  circle(x, y, s);
}
