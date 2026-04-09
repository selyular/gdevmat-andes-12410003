public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public int col;

  public Walker(){}

  public void applyForce(PVector force) 
  {
    PVector f = PVector.div(force, this.mass);
    acceleration.add(f);
  }

  public void update() 
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void render() 
  {
    fill(col);
    noStroke();
    circle(position.x, position.y, scale);
  }

  public void checkEdges() 
  {
    if (position.x <= 0 || position.x >= width) 
    {
      velocity.x *= -1;
      position.x = constrain(position.x, 0, width);
    }
    if (position.y <= 0 || position.y >= height) 
    {
      velocity.y *= -1;
      position.y = constrain(position.y, 0, height);
    }
  }
}
