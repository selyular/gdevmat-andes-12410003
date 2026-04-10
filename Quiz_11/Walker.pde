public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public int col;
  
  public float gravitationalConstant = 1;

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
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass / (distance * distance));
    force.mult(strength);
    return force;
  }
}
