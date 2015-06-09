use <base.scad>;

boxRadius = 100;
boxHeight = 35;
boxWallThickness = 10;
innerCornerRadius = 5;
capHeight = 10;
capWallThickness = 10.2;

// Draw box
translate([0,0,0])
  drawBox(boxRadius, boxHeight, boxWallThickness, innerCornerRadius);

// Draw cap
translate([0,0,75])
  drawCap(boxRadius, capHeight, 0, 0, 0, capWallThickness, innerCornerRadius);
