public class Walker 
{
  public PVector position = new PVector(); 
  public float scale = 15; 
  
  public float r = 255;
  public float g = 255;
  public float b = 255;
  
  public Walker(){}
  
  void spawnBlackHole()
{
  blackHole.position.x = random(-width/2, width/2);
  blackHole.position.y = random(-height/2, height/2);
  blackHole.scale = 50;
}
  
  public void render()
  {
    fill(r, g, b);
    noStroke();
    circle(position.x, position.y, scale); 
  }
}
