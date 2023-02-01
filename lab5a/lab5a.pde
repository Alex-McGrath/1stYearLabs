// Drag and drop Jama.Jar onto IDE/PDE 
// http://math.nist.gov/javanumerics/jama/
// http://math.nist.gov/javanumerics/jama/doc/
float OriginX = 200, OriginY = 200; 
float angle=0;
/// STEP 1: ADD A SECOND ANGLE VARIABLE HERE CALLED angle1
float angle1=0;
void setup() {
 // Create a window 200x200
 size(400, 400);
}
void draw() {
 background(255);
 // Draw button
 // Fill colour RGB
 fill(0, 0, 0);
 // Rectangle
 rect(10, 10, 50, 20);
 // Add text "Rotate"
 textSize(12);
 fill(255, 255, 255);
 text("Rotate", 16, 24); 
 if (mousePressed)
 {
 if (mouseX>10 && mouseX <60 && mouseY>10 && mouseY <30)
 {
 angle+=3.0*(PI/180);
 /// STEP 2: ADD CODE HERE TO UPDATE angle1 AT TWICE THE RATE OF angle
 angle1+=6.0*(PI/180);
 }
 }
 // Create points on a 40x40 square centered on 0,0 (X's row 1, Y's row 2)
 double[][] Pvals = {{-20, 20, 20, -20}, 
 {-20, -20, 20, 20}};
 Matrix P = new Matrix(Pvals);
 
 // Draw the original square
 draw_quad(P);
 //// Create rotation matrix through 45 degrees
 double[][] Rvals = {{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}};
 Matrix R = new Matrix(Rvals);
 // Apply rotation matrix to the points
 Matrix P1=R.times(P);
 
 /// STEP 3: ADD CODE HERE TO CREATE A SECOND ROTATION MATRIX CALLED R1
 /// BASED ON THE VALUE OF angle1
 double[][] Rvals1 = {{cos(angle1), -sin(angle1)}, {sin(angle1), cos(angle1)}};
 Matrix R1 = new Matrix(Rvals1);

 /// STEP 4: ADD CODE HERE TO CREATE A THIRD SQUARE CALLED P2 WHICH SHOULD
 /// BE COMPUTED IN A SIMILAR MANNER TO P1 BUT USING R1 (NOT R)
 Matrix P2 = R1.times(P);
 
 //// Create a 2D translation matrix to move 50,100
 double tx = 50, ty = 100;
 double[][] Tvals = {{tx, tx, tx, tx}, {ty, ty, ty, ty}};
 Matrix T = new Matrix(Tvals);
 // Apply translation to the points
 P1=P1.plus(T);
 
 /// STEP 5: ADD CODE HERE TO CREATE A SECOND 2D TRANSLATION MATRIX 
 /// CALLED T2 using the values tx2 = 50, ty2 = -100
 double tx2 = 50, ty2 = -100;
 double[][] Tvals2 = {{tx2, tx2, tx2, tx2}, {ty2, ty2, ty2, ty2}};
 Matrix T2 = new Matrix(Tvals2);
 
 /// STEP 6: ADD CODE TO APPLY THE TRANSLATION IN T2 TO THE VALUES 
 /// IN P2
 P2=P2.plus(T2);
 // Print points (column width, number of digits) to console
 P1.print(5, 2);
 // Draw Second Square
 draw_quad(P1);
 
 /// STEP 7: ADD CODE TO CALL draw_quad WITH P2
 draw_quad(P2);
}
void draw_quad(Matrix P){
 // Extract point infromation from matrix 
 float X1=(float)P.get(0, 0)+OriginX;
 float Y1=(float)P.get(1, 0)+OriginY;
 float X2=(float)P.get(0, 1)+OriginX;
 float Y2=(float)P.get(1, 1)+OriginY; 
 float X3=(float)P.get(0, 2)+OriginX;
 float Y3=(float)P.get(1, 2)+OriginY;
 float X4=(float)P.get(0, 3)+OriginX;
 float Y4=(float)P.get(1, 3)+OriginY; 
 // Draw rectangle
 line(X1, Y1, X2, Y2);
 line(X2, Y2, X3, Y3);
 line(X3, Y3, X4, Y4);
 line(X1, Y1, X4, Y4); 
}
