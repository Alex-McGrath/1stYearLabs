//--------------------------------------------------------------------
int   timer, rec = 25, elapsed = rec;
byte  aliveNum = 0;  // byte needs to be initialized in JS mode!
 
final static byte FPS = 30, SPD = 6, BOLD = 4, TEXT_SIZE = 25;
final static byte BALL_NUM = 100, BALL_SIZE = 60;
final static Balloon[] balloons = new Balloon[BALL_NUM];
 
final static color BG = -1, FG = 0;
final static color NAVY = #000080, SADDLE_BROWN = #904010;
 
final static String GFX = JAVA2D; // use JAVA2D or P2D
/**************************************************************************/
void setup() {
  size(800, 600, GFX);
  frameRate(25);
  noSmooth();
  cursor(HAND);
 
  textLeading(TEXT_SIZE);
  textSize(TEXT_SIZE);
 
  stroke(FG);
  strokeWeight(BOLD);
 
  focused = true;  // JavaScript only
 
  for ( byte i=BALL_NUM; i!=0; balloons[--i] = new Balloon() );
}
/**************************************************************************/
void draw() {
  background(BG);
 
  if (aliveNum == 0)     createBalloons();
  if (!focused)          mouseX = mouseY = -02000;
 
  for ( byte i=BALL_NUM; i!=0; balloons[--i].all() );
 
  showScore();
}
/**************************************************************************/
void showScore() {
  elapsed = (millis() - timer)/1000;  // Java
 
 
  fill(NAVY);
  text("Time:\nRecord:\nAlive:", 20, 40);
 
  fill(SADDLE_BROWN);
  text(elapsed + "\n" + rec + "\n" + aliveNum, TEXT_SIZE*6, 40);
}
/**************************************************************************/
void createBalloons() {
  rec = min(rec, elapsed);
 
  for (int i=0; i!=BALL_NUM; i++) {
    int w = (int) random(BALL_SIZE>>1, BALL_SIZE + 1);
    int h = (int) random(10, BALL_SIZE>>1) + w;
 
    int x = (int) random(w>>1, width  - w/2);
    int y = (int) random(h>>1, height - h/2);
 
    int mvX = (int) random(SPD>>1, SPD + 1);
    int mvY = (int) random(1, SPD>>2) + mvX;
 
    color c = (color) random(020 << 20) | (color) random(0100, 0300) << 030;
 
    balloons[i].respawn(x, y, w, h, mvX, mvY, c);
  }
 
  aliveNum = BALL_NUM;
  timer = millis();
}
/**************************************************************************/
class Balloon {
  int x, y;
  int w, h, rw, rh;
  int vx, vy;
  color c;
  boolean isDead;
  //////////////////////////////////////////////////////////////////////////
  Balloon() {
    isDead = true;
  }
  //////////////////////////////////////////////////////////////////////////
  Balloon(int xx, int yy, int ww, int hh, 
  int spdX, int spdY, color colour) {
    respawn(xx, yy, ww, hh, spdX, spdY, colour);
  }
  //////////////////////////////////////////////////////////////////////////
  void respawn(int xx, int yy, int ww, int hh, int sx, int sy, color ink) {
    x = xx;
    y = yy;
 
    w = ww;
    h = hh;
    rw = ww >> 1;
    rh = hh >> 1;
 
    vx = sx;
    vy = sy;
 
    c = ink;
 
    isDead = false;
  }
  //////////////////////////////////////////////////////////////////////////
  void display() {
    fill(c);
    ellipse(x, y, w, h);
  }
  //////////////////////////////////////////////////////////////////////////
  void update() {
    if ( (x += vx) < rw | x > width  - rw )  vx *= -1;
    if ( (y += vy) < rh | y > height - rh )  vy *= -1;
  }
  //////////////////////////////////////////////////////////////////////////
  boolean isHit() {
    return sq(mouseX - x)/(rw*rw) + sq(mouseY - y)/(rh*rh) < 1;
  }
  //////////////////////////////////////////////////////////////////////////
  void all() {
    if (isDead)   return;
 
    update();
    display();
 
    if ( isDead = isHit() )   --aliveNum;
  }
  //////////////////////////////////////////////////////////////////////////
}
