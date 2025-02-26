public int base = 5;
public int r, g, b;
public int num_points;

public void setup() {
  noLoop();
  size(720, 720);
  r = 255;
  g = 255;
  b = 255;
  num_points = 6;
}

public void draw() {
  background(0);
  fill(r, g, b);
  fractal(width/2, height/2, width/3, base, num_points);
  text("base: " + base, width - 60, height - 10);
  text("r: " + r, width - 60, height - 30);
  text("g: " + g, width - 60, height - 40);
  text("b: " + b, width - 60, height - 50);
}

public void keyPressed() {
  if (key == '-' && base > 1) base /= 2;
  if (key == '=') base *= 2;
  if (key == 'r') r = (int)(Math.random()*256);
  if (key == 'g') g = (int)(Math.random()*256);
  if (key == 'b') b = (int)(Math.random()*256);
  if (key == '0') r = g = b = 255;
  redraw();
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

public void fractal(float x, float y, float len, int base, int npoints) {
  if (len <= base) {
    polygon(x, y, len, npoints);
  } else {
    float angle = TWO_PI / npoints;
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * len;
      float sy = y + sin(a) * len;
      fractal(sx, sy, len/2, base, npoints);
    }
    // fractal(x-len, y-sqrt(3)*len, len/2, base);
    // fractal(x-len/2, y+len/2, len/2, base);
    // fractal(x+3*len/2, y+len/2, len/2, base);
  }
}
