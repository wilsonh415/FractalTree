private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,450);   
	drawBranches(320,450, 90, 3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
	int endX1, endY1, endX2, endY2;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	endX1 = (int)(branchLength*Math.cos(angle1) + x);
	endY1 = (int)(branchLength*Math.sin(angle1) + y);
	endX2 = (int)(branchLength*Math.cos(angle2) + x);
	endY2 = (int)(branchLength*Math.sin(angle2) + y);
	branchLength = branchLength*fractionLength;
	line(x,y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1+.2);
		drawBranches(endX2, endY2, branchLength, angle2-.2);
	}
}
