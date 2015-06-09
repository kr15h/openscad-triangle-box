use <base.scad>;

boxRadius = 100;
boxHeight = 35;
boxWallThickness = 10;
innerCornerRadius = 5;
capHeight = 10;
capWallThickness = 10.2;

// Draw box
translate([boxRadius, -boxRadius, 0])
  text("box", halign="center");

translate([boxRadius,0,-20])
  drawBox(boxRadius, boxHeight, boxWallThickness, innerCornerRadius);

// Draw cap
translate([-boxRadius, -boxRadius, 0])
  text("cap", halign="center");

translate([-boxRadius,0,1])
  drawCap(boxRadius, capHeight, 0, 0, 0, capWallThickness, innerCornerRadius);
