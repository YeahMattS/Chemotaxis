
 Bacteria colony[] = new Bacteria[50];
 boolean bias = false;

 void setup()   
 {       
 	size(500, 500);
 	background(128, 64, 0);
 	frameRate(45);
 	for (int i =0; i < colony.length; i++)
 	{
 		colony[i] = new Bacteria();
	}
 }   

 void draw()   
 {    
 	//move and show the bacteria
 	fill(128, 64, 0, 56);
 	rect(-10, -10, 600, 600);
 	for (int i =0; i < colony.length; i++)
 	{
 		colony[i].show();
 		colony[i].move();
 	} 
 	if (bias)
	{
		food();
	} 	
 }  

 void food()
 {
 	//main slab of cheese
 	fill(255, 153, 0);
 	noStroke();
 	arc(mouseX, mouseY, 40, 40, 0, 3*PI/2);
 	// holes
 	stroke(205, 103, 0);
 	strokeWeight(3);
 	fill(255, 128, 0);
 	ellipse(mouseX-10, mouseY-10, 8, 8);
 	ellipse(mouseX+10, mouseY + 10, 8, 8);
 	ellipse(mouseX-10, mouseY + 5, 8, 8);
 	ellipse(mouseX, mouseY+10, 8, 8);
 }

// food creation trigger
 void mouseClicked()
 {
 	bias = !bias;
 }

// sweeping function
 void keyPressed()
 {
 	// press space to knock away the bacteria
 	if (key == ' ' && bias)
 	{
    	for (int i =0; i < colony.length; i++)
 		{
 			if ((colony[i].x == mouseX) && (colony[i].y == mouseY))
 			{
 				colony[i].x = (int)(Math.random()*401)+50;
 				colony[i].y = (int)(Math.random()*401)+50;
 			}
 		} 
 	}
 }

 class Bacteria    
 {     
 	int x, y, r, green;
 	Bacteria()
 	{
 		x = (int)(Math.random()*401)+50;
 		y = (int)(Math.random()*401)+50;
 		green = (int)(Math.random()*256);
 		r = (int)(Math.random()*11)+5;
 	}

 	void show()
 	{
 		stroke(0, green, 0);
 		fill(0, green, 0);
 		ellipse(x, y, r, r);
 	}

 	void move()
 	{
 		if (bias)
 		{
 			// biased x movement
 			if (x < mouseX)
 			{
 				x += (int)(Math.random()*4)-1;
 			}
 			else if (x > mouseX)
 			{
 				x += (int)(Math.random()*4)-2;
 			}

 			// biased y movement
 			if (y < mouseY)
 			{
				y += (int)(Math.random()*4)-1;
 			}
 			else if (y > mouseY)
 			{
 				y += (int)(Math.random()*4)-2;
 			}
 		}
 		else // default movement
 		{
 			x += (int)(Math.random()*5)-2;	
 			y += (int)(Math.random()*5)-2;
 		}
 	}
 }    