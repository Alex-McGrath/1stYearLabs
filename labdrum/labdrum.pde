// import Minim 
import ddf.minim.*; 
 
Minim minim; 
AudioSample d1; 
AudioSample d2; 
AudioSample d3; 
AudioSample d4;
 
AudioOutput out; 
 
// track when a drum has been struck 
boolean drum1struck; 
boolean drum2struck; 
boolean drum3struck; 
boolean drum4struck;
 
void setup() { 
  // initialize the screen 
  size(210, 220); 
  smooth(); 
 
  // initialize sound 
  minim = new Minim(this); 
  out = minim.getLineOut(); 
  
  d1 = minim.loadSample("bongo1.wav"); 
  d2 = minim.loadSample("bongo7.wav");
  d3 = minim.loadSample("tom1.wav");
  d4 = minim.loadSample("tom2.wav");
 
  // set boolean variables to initialize the graphics 
  drum1struck = false; 
  drum2struck = false; 
  drum3struck = false; 
  drum4struck = false;
} 
 
void draw() { 
   background(255); 
 
  // draw the drums: if a drum has just been struck 
  // then fill its ellipse with color as visual feedback for the user 
 
  // drum 1 
  if (drum1struck == true) { 
    fill(255,0,0); 
    drum1struck = false; 
  } else { 
    fill(255); 
  } 
  ellipse(50, 55, 100, 100); 
 
  // drum 2 
  if (drum2struck == true) { 
    fill(0); 
    drum2struck = false; 
  } else { 
    fill(255); 
  } 
  ellipse(160, 55, 100, 100); 
  
  // drum 3
  if (drum3struck == true) { 
    fill(0,255,0); 
    drum3struck = false; 
  } else { 
    fill(255); 
  } 
  ellipse(50, 165, 100, 100); 
  // drum 4
  if (drum4struck == true) { 
    fill(0,0,255); 
    drum4struck = false; 
  } else { 
    fill(255); 
  } 
  ellipse(160, 165, 100, 100);
} 
 
void keyPressed() { 
  if (key == 'a' || key == 'A') {   //note you may have to retype the 
    drum1struck = true;             //single quote marks after copying 
    d1.trigger(); 
  } 
  else if (key == 'b' || key == 'B') { 
    drum2struck = true; 
    d2.trigger(); 
  } 
}
void mousePressed() { 
  if(mouseX< width/2&&mouseY<height/2){ 
       d1.trigger();
       //set Boolean for drum1 to true 
       drum1struck = true; 
  } 
  else if(mouseX>width/2&&mouseY<height/2){ 
       d2.trigger();
       drum2struck = true; 
  }
  else if(mouseX<width/2&&mouseY>height/2){ 
       d3.trigger();
       drum3struck = true; 
  }
  else{
    d4.trigger();
    drum4struck=true;
  }
}
