public class Walker 
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  
  float velocityLimit = 10;
  float scale = 15;
  
  public Walker(){}
  
  void update() 
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
  }
  
  void render() 
  {
    fill(130);
    circle(position.x, position.y, scale);
  }
  
  void checkEdges() 
  {
    if (position.x > Window.right) 
    {
      position.x = Window.left;
    }
    else if (position.x < Window.left) 
    {
      position.x = Window.right;
    }
    
    if (position.y > Window.top) 
    {
      position.y = Window.bottom;
    }
    else if (position.y < Window.bottom) 
    {
      position.y = Window.top;
    }
  }
}
