float g=-9.81;
float k=0.2;    // Spring constant
float m=0.50;   // Mass kg
float dt=0.01;  // Time step 50ms


float vy=0;     // Initial velocity
float y;   // Initial position *************

float x = 5.0;
float vx;

float t;// Initial time ***********


void setup()
{
  size(500, 500);
  y = 10;
  x = 0;

  vx = 1;
  vy = 0;

  t = 0;
}

void draw()
{

  background(255, 255, 255);
  vy=vy+(g-((k/m)*vy))*dt;
  y=y+(vy*dt);

  vx = vx + (((k/m)*vx))*dt;
  x = x+(vx*dt);

  t=t+dt;

  if (y<0) vy = vy*(-1);
  if (x>10) vx = vx*(-1);
  if (x<0) vx = vx*(-1);

  float sx=map(x, 0, 10, 0, width);
  float sy=map(y, 0, 10, height-1, 0);
  fill(255, 0, 0);
  ellipse(sx, sy, 20, 20);
}
