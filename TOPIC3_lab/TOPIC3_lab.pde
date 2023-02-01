int GRID_SIZE = 16; // How many cells will we create in our grid. 

// This array will hold the color number 
// for each of the grid cells
int[] gridCellColors = new int[GRID_SIZE];

// This array will indicate if the user has 
// clicked on the corresponding grid
int[] gridCellChoices = new int[GRID_SIZE];

int USER_COLOR = -1; // initially the user does not have a colour choice

int moves = 0; // the number of moves or clicks the user has made. 

int TOTAL_RED = 0; // total red color cells
int TOTAL_GREEN = 0; // total blue color cells. 

boolean keepPlaying = true; // controls game play. 
void setup()
{
  // Please put your student ID number here in the 
  // title of the surface panel. 
  surface.setTitle("Topic 3 Student ID 21397613");
  // setup function.
  // Here we setup our output environment.
  // Some of these variables can be changed later in our code.
  size(500, 500); // size of our image or panel
  stroke(0, 0, 0); // color of drawn objects = black
  strokeWeight(4); // weight of the line around objects.
  background(255, 255, 255); // white background
  
  line(width*0.25, 0, width*0.25, height); //25% the width
  line(width*0.5, 0, width*0.5, height);  // 50% the width
  line(width*0.75, 0, width*0.75, height); // 75% the height

  line(0, height*0.25, width, height*0.25); //25% height
  line(0, height*0.5, width, height*0.5); // middle
  line(0, height*0.75, width, height*0.75); //75% height

// This should be before the closing curly backet for the setup function
  keepPlaying = true; // controls game play. 
  TOTAL_RED = 0;
  TOTAL_GREEN = 0;

  // we are going to assign a color (red, green  )
  // to each grid cell. Let's give these our own special code.
  // 0 is red, 1 is green.

  // Now let's randomly fill the gridCellColors array

  for (int i = 0; i < gridCellColors.length; i++)
  {
    gridCellColors[i] = (int)random(0, 2); // random number 0, 1, when cast to int.

    if (gridCellColors[i] == 0)
      TOTAL_RED++;
    else if (gridCellColors[i] == 1)
      TOTAL_GREEN++;

    gridCellChoices[i] = -1; // The user has not chosen this cell yet.
    // so we assign the value of -1 to every cell. This is like a 
    // default value. 
  }
  moves = 0; // number of moves or clicks by the user starts at zero
  USER_COLOR  = -1; // user is not assigned any color yet. 

  println("TOTAL RED = "+ TOTAL_RED);
  println("TOTAL GREEN = "+ TOTAL_GREEN);
  
  float probRedChoice = (float)TOTAL_RED/GRID_SIZE;
  float probGreenChoice = (float)TOTAL_GREEN/GRID_SIZE;
  
  println("Probability of RED on 1st click "+ probRedChoice);
  println("Probability of GREEN on 1st click "+ probGreenChoice);
} // end setup

void draw()
{
}
void mouseClicked()
{
    if (keepPlaying == true) // continue to play
    {
      colorTheClickedGridCell(mouseX, mouseY);
      if (moves == 0) // the first cell click
      {
        // find the only non -1 in the array 
        // that's the user color. 
        for (int i = 0; i < gridCellChoices.length; i++)
        {
          if (gridCellChoices[i] != -1)
          {
           USER_COLOR =  gridCellChoices[i]; // this is now the user color
           // this is either red (0) or green (1) 
          }
        }
      }
      moves++; // next move.
      //now print out the probabilities
      calculateProbabilities(USER_COLOR);
      
      if (checkIfGameOver())
      {
        textSize(70);
        fill(0, 0, 0);
        text("You Lose!", 10, height/2); 
        keepPlaying = false; // don't allow more clicks. 
      }
      // We allow the user to match 3 colors OR 
      // all of their assigned color. 
      if (checkIfUserHasWon(USER_COLOR, 3))
      {
        textSize(70);
        fill(0, 0, 0);
        text("You Win :-)", 10, height/2);       
        keepPlaying = false; // don't allow more clicks. 
      }
    } // end of if statement 
} //end of mouseClicked()

void colorTheClickedGridCell(float xCoord, float yCoord)
{
  if ((xCoord >= 0) && (xCoord <= 0.25*width) && (yCoord >= 0) && (yCoord <= 0.25*height))
  {
    println("Grid Cell 0");
    if (gridCellColors[0] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[0] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[0] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[0] = 1; // the user choice is green for this cell  
    }
      
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0, 0, 0.25*width, 0.25*height);
    
  } else if ((xCoord > 0.25*width) && (xCoord <= 0.5*width) && (yCoord >= 0) && (yCoord <= 0.25*height))
  {
    println("Grid Cell 1");
    if (gridCellColors[1] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[1] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[1] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[1] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
        
    rect(0.25*width, 0, 0.25*width, 0.25*height);    
    
    
  } else if ((xCoord > 0.5*width) && (xCoord <= 0.75*width) && (yCoord >= 0) && (yCoord <= 0.25*height))
  {
    println("Grid Cell 2");
    if (gridCellColors[2] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[2] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[2] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[2] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.5*width, 0, 0.25*width, 0.25*height);    
    
  } else if ((xCoord > 0.75*width) && (xCoord <= width) && (yCoord >= 0) && (yCoord <= 0.25*height))
  {
    println("Grid Cell 3");
    if (gridCellColors[3] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[3] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[3] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[3] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.75*width, 0, 0.25*width, 0.25*height);
    
  } else if ((xCoord >= 0) && (xCoord <= 0.25*width) && (yCoord > 0.25) && (yCoord <= 0.5*height))
  {
    println("Grid Cell 4");
    if (gridCellColors[4] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[4] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[4] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[4] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0, 0.25*height, 0.25*width, 0.25*height);
    
  } else if ((xCoord > 0.25*width) && (xCoord <= 0.5*width) && (yCoord > 0.25) && (yCoord <= 0.5*height))
  {
    println("Grid Cell 5");
    if (gridCellColors[5] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[5] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[5] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[5] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
        
    rect(0.25*width, 0.25*height, 0.25*width, 0.25*height);
    
  } else if ((xCoord > 0.5*width) && (xCoord <= 0.75*width) && (yCoord > 0.25) && (yCoord <= 0.5*height))
  {
    println("Grid Cell 6");
    if (gridCellColors[6] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[6] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[6] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[6] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.5*width, 0.25*height, 0.25*width, 0.25*height);
    
  } else if ((xCoord > 0.75*width) && (xCoord <= width) && (yCoord > 0.25) && (yCoord <= 0.5*height))
  {
    println("Grid Cell 7");
    if (gridCellColors[7] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[7] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[7] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[7] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.75*width, 0.25*height, 0.25*width, 0.25*height);
  } else if ((xCoord >= 0) && (xCoord <= 0.25*width) && (yCoord > 0.5) && (yCoord <= 0.75*height))
  {
    println("Grid Cell 8");
    if (gridCellColors[8] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[8] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[8] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[8] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0, 0.5*height, 0.25*width, 0.25*height);
  } else if ((xCoord > 0.25*width) && (xCoord <= 0.5*width) && (yCoord > 0.5) && (yCoord <= 0.75*height))
  {
    println("Grid Cell 9");
    if (gridCellColors[9] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[9] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[9] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[9] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.25*width, 0.5*height, 0.25*width, 0.25*height);
  } else if ((xCoord > 0.5*width) && (xCoord <= 0.75*width) && (yCoord > 0.5) && (yCoord <= 0.75*height))
  {
    println("Grid Cell 10");
    if (gridCellColors[10] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[10] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[10] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[10] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.5*width, 0.5*height, 0.25*width, 0.25*height);
  } else if ((xCoord > 0.75*width) && (xCoord <= width) && (yCoord > 0.5) && (yCoord <= 0.75*height))
  {
    println("Grid Cell 11");
    if (gridCellColors[11] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[11] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[11] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[11] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.75*width, 0.5*height, 0.25*width, 0.25*height);
  } else if ((xCoord >= 0) && (xCoord <= 0.25*width) && (yCoord > 0.75) && (yCoord <= height))
  {
    println("Grid Cell 12");
    if (gridCellColors[12] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[12] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[12] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[12] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0, 0.75*height, 0.25*width, 0.25*height);
  } else if ((xCoord > 0.25*width) && (xCoord <= 0.5*width) && (yCoord > 0.75) && (yCoord <= height))
  {
    println("Grid Cell 13");
    if (gridCellColors[13] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[13] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[13] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[13] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.25*width, 0.75*height, 0.25*width, 0.25*height);
  } else if ((xCoord > 0.5*width) && (xCoord <= 0.75*width) && (yCoord > 0.75) && (yCoord <= height))
  {
    println("Grid Cell 14");
    if (gridCellColors[14] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[14] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[14] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[14] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.5*width, 0.75*height, 0.25*width, 0.25*height);
  } else
  {
    println("Grid Cell 15");
    if (gridCellColors[15] == 0)  
    {  
      fill(255,0,0); // this cell must be red
      gridCellChoices[15] = 0; // the user choice is red for this cell
    }
    if (gridCellColors[15] == 1)  
    {  
      fill(0,255,0); // This cell must be green
      gridCellChoices[15] = 1; // the user choice is green for this cell  
    }
    // now draw the rectangle. Processing will use the fill color. 
    
    rect(0.75*width, 0.75*height, 0.25*width, 0.25*height);
  }
}
void keyPressed()
{
  if ((key == 'q') || (key == 'Q'))
  {
    setup();
  }
}
boolean checkIfGameOver()
{
  boolean gameOver = false;
  for (int i = 0; i < gridCellChoices.length; i++)
  {
    if ((gridCellChoices[i] != -1) && (gridCellChoices[i] != USER_COLOR))
    {
      gameOver = true;
    }
  }
  return gameOver;
}
boolean checkIfUserHasWon(int userColor, int matchTarget)
{
  int numberOfMatches = 0;
  boolean userHasWon = false;
  for (int i = 0; i < gridCellChoices.length; i++)
  {
    if ((gridCellChoices[i] != -1) && (gridCellChoices[i] == userColor))
    {
      numberOfMatches = numberOfMatches + 1;
    }
  }

  if ((numberOfMatches == TOTAL_RED) && (userColor == 0))
  {
    userHasWon = true;
  } 
  else if ((numberOfMatches == TOTAL_GREEN) && (userColor == 1))
  {
    userHasWon = true;
  }
  else if (numberOfMatches == matchTarget)
  {
    userHasWon = true;
  }

  return userHasWon;
} // end checkIfUserHasWon 
void calculateProbabilities(int USER_COLOR)
{
  // how many cells are already clicked and coloured
  int cellsClicked = 0; 
  for (int i = 0; i < gridCellChoices.length; i++)
  {
    if ((gridCellChoices[i] != -1) && (gridCellChoices[i] == USER_COLOR))
    {
      cellsClicked++;
    }
  }
  // now calculate the probability for each possible color.
  if (USER_COLOR == 0) // red
  {
    float probRed = (float)(TOTAL_RED - cellsClicked)/(GRID_SIZE - cellsClicked);
    println("The probability of next RED is " + probRed);
  }
  if (USER_COLOR == 1) // green
  {
    float probGreen = (float)(TOTAL_GREEN - cellsClicked)/(GRID_SIZE - cellsClicked);
    println("The probability of next GREEN is " + probGreen);
  }
} // end of calculateProbabilities.
