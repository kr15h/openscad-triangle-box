use <modules.scad>;

boxRadius = 100;
boxHeight = 35;
boxWallThickness = 10;
innerCornerRadius = 5;
capHeight = 10;
capWallThickness = 10.5;

// Draw box
projection(cut=true) 
  translate([0,0,-20])
    drawBox(boxRadius, boxHeight, boxWallThickness, innerCornerRadius);

// Draw cap
// Notice that you have to remove the wall thickness difference between the box wall thickness and cap wall thickness from the innerCornerRadius
projection(cut = true) 
  translate([0,0,1])
    drawCap(boxRadius, capHeight, 0, 0, 0, capWallThickness, innerCornerRadius - (capWallThickness - boxWallThickness));