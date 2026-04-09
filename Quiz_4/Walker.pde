public class Walker
{
  public float x;
  public float y;

  public float tx = 0;
  public float ty = 10000;

  public float ts = 20000;

  public float tr = 30000;
  public float tg = 40000;
  public float tb = 50000;

  public float thick = 5;
  public float r = 255, g = 255, b = 255;

  void render()
  {
    fill(r, g, b);
    noStroke();
    circle(x, y, thick);
  }

  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);

    thick = map(noise(ts), 0, 1, 5, 150);

    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    // im not sure if its just supposed to be blue to purple ToT
    b = 255;

    tx += 0.01f;
    ty += 0.01f;

    ts += 0.01f;

    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }
}
