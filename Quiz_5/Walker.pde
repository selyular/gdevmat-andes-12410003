public class Walker 
{
  public PVector position = new PVector(); 
  public PVector speed = new PVector(5,8);
  public float scale = 15; 
  
  public Walker(){}
  
  public void moveAndBounce()
  {
    position.add(speed); 
    
    if ((position.x > Window.right) || (position.x < Window.left)) 
    {
      speed.x *= -1; 
    }
  
    if ((position.y > Window.top) || (position.y < Window.bottom)) 
    {
      speed.y *= -1; 
    }
  }
  
  public void render()
  {
    fill(182, 52, 180); 
    circle(position.x, position.y, scale); 
  }
}
