float X=200;    // Origin : Note we have now centred the origin in the X-direction
float Y=350;
float ax=300;  // Vector a resolved into components
float ay=-100;
float bx=0;    // Vector b resolved into components
float by=-300;
Matrix a;
Matrix b;   
void setup() 
{
     size(400,400);      // Create a drawing window
     strokeWeight(3);    // Make pen 3 pixels wide for all lines     
     double [][] anums = {{ax},
                         {ay}};                         
     double [][] bnums = {{bx},
                         {by}};
     a = new Matrix(anums);
     b = new Matrix(bnums);
}

void draw()
{
     background(255);     // Clear screen

     // Evaluate equation (1.5)
     // STEP1: Insert code here that computes a_unit (i.e. the unit vector in the 
     // direction of a
     
       double length = a.norm2();
       Matrix a_unit = a.times(1/length);
       
     // STEP2: Insert code here to compute the dot product of b and a_unit
     
       Matrix a_unit_T = a_unit.transpose();    
       Matrix projection = a_unit_T.times(b);
       double lp = projection.get(0,0);
       
     // STEP3: Insert code here to compute the vector p using equation 1.5 above
     
       Matrix p = a_unit.times(lp);       
     float px = (float)p.get(0,0);
     float py = (float)p.get(1,0);
     float ax = (float)a.get(0,0); 
     float ay = (float)a.get(1,0);
     float bx = (float)b.get(0,0); 
     float by = (float)b.get(1,0);     
     
     // Draw the projection of b onto a
     stroke(0,0,0);             // Use a black pen
     ellipse(X+px,Y+py,10,10);  // point where b projects onto a
     line(X+px,Y+py,X+bx,Y+by); // line from a to point of projection on b
     stroke(255,0,0);     // Make pen red
     arrow(X,Y,X+ax,Y+ay); // Draw vector a starting at (X,Y)
     stroke(0,255,0);     // Make pen green
     arrow(X,Y,X+bx,Y+by); // Draw vector b starting at (X,Y) 
     // STEP 4. Insert code here to add a new vector at 90 degrees to the vector a
     
       double [][] cnums = {{ay},
                           {-ax}};
       Matrix c = new Matrix(cnums);                   
       float cx = (float)c.get(0,0); 
       float cy = (float)c.get(1,0);
       stroke(0,0,255);
       arrow(X,Y,X+cx,Y+cy);
       
     // STEP 5. Insert code here to compute and draw the projection of b onto c     

      double length1 = c.norm2();
     Matrix c_unit= c.times(1/length1);

      Matrix c_unit_T = c_unit.transpose();
      Matrix projection1 = c_unit_T.times(b);
      double lp1 = projection1.get(0,0);
      Matrix r = c_unit.times(lp1);
      float rx = (float)r.get(0,0);
      float ry = (float)r.get(1,0);

     stroke(0,0,0);             // Use a black pen
     ellipse(X+rx,Y+ry,10,10);  // point where b projects onto a
     line(X+rx,Y+ry,X+bx,Y+by); // line from a to point of projection on b
     
     if (mouseButton == RIGHT)
     {
        a.set(0,0,(double)mouseX-X);
        a.set(1,0,(double)mouseY-Y);
     }
     if (mouseButton == LEFT) 
     {
        b.set(0,0,(double)mouseX-X);
        b.set(1,0,(double)mouseY-Y);
     } 
       float len=sqrt((px*px)+(py*py));
     float ang=180*atan2(py,px)/PI;
     textSize(18);
     fill(0,0,255);
     text("Angle:"+round(ang),250,20);
     text("Length:"+round(len),250,50);
}
// Draw an arrow from (x1,y1) to (x2,y2)   
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
