float X=50;    // Origin 
float Y=350;
    
float ax=300;  // Vector a resolved into components
float ay=-100;
float bx=0;    // Vector b resolved into components
float by=-300;
   
void setup() 
{
     size(400,400);      // Create a drawing window
     strokeWeight(3);    // Make pen 3 pixels wide for all lines
}
   
void draw()
{
     background(255);     // Clear screen
     // Evaluate equation (1.5)
     float dot=(ax*bx)+(ay*by);             // a.b (dot product a and b) 
     float mag=sqrt(pow(ax,2)+pow(ay,2));   // length (magnitude) of a
     float component=dot/mag;               // find scalar magnitude |AB|  
     float px=ax*(component/mag);           // x component of vector projection 
     float py=ay*(component/mag);           // y component of vector projection 


     // Draw the projection of b onto a
     stroke(0,0,0);             // Use a black pen
     ellipse(X+px,Y+py,10,10);  // point where b projects onto a
     line(X+px,Y+py,X+bx,Y+by); // line from a to point of projection on b


     stroke(255,0,0);     // Make pen red
     line(X,Y,X+ax,Y+ay); // Draw vector a starting at (X,Y)
     stroke(0,255,0);     // Make pen green
     line(X,Y,X+bx,Y+by); // Draw vector b starting at (X,Y)
     if (mouseButton == RIGHT)
   {
        ax=mouseX-X;
        ay=mouseY-Y;
   }
   if (mouseButton == LEFT) 
   {
        bx=mouseX-X;
        by=mouseY-Y;
   } 

  float len=sqrt((px*px)+(py*py));
     float ang=180*atan2(py,px)/PI;
     textSize(18);
     fill(0,0,255);
     text("Angle:"+round(ang),250,20);
     text("Length:"+round(len),250,50);

}// Draw an arrow from (x1,y1) to (x2,y2)   
void arrow(float x1, float y1, float x2, float y2) 
{
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -8, -8);
  line(0, 0, 8, -8);
  popMatrix();
} 
