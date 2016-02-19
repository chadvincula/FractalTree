private double fractionLength = .8; 
private int smallestBranch = 50; 
private double branchAngle = .4;  
public void setup() 
{   
	size(800, 800);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(255, 255, 0);   
	line(width/2, 0, width/2, 200);   
	drawBranches(width/2, 100, 180, Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here
	double angle1, angle2, angle3;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	angle3 = angle;
	branchLength *= fractionLength;
	int endX1, endY1, endX2, endY2, endX3, endY3;
	endX1 = (int)(branchLength*Math.cos(angle1) + x);
	endY1 = (int)(branchLength*Math.sin(angle1) + y);
	endX2 = (int)(branchLength*Math.cos(angle2) + x);
	endY2 = (int)(branchLength*Math.sin(angle2) + y);
	endX3 = (int)(branchLength*Math.cos(angle3) + x);
	endY3 = (int)(branchLength*Math.sin(angle3) + y);
	if(branchLength <= smallestBranch + 5)
	{
		stroke(255, 255, 0);
		ellipse(endX1, endY1, 10, 20);
		ellipse(endX2, endY2, 10, 20);
		ellipse(endX3, endY3, 10, 20);
	}
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	line(x, y, endX3, endY3);
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength - 0.1, angle1);
		drawBranches(endX2, endY2, branchLength - 0.1, angle2);
		drawBranches(endX3, endY3, branchLength - 0.1, angle3);
	}
}