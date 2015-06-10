module drawBox(radius, height, crust, drillRadius) {
  difference() {
    drawBoxBase(radius, height, 0);
    cavityRadius = (radius * sin(30) - crust) / sin(30);
    translate([0, 0, crust]) {
      drawBoxBase(cavityRadius, height, drillRadius);
    }
  }
}

module drawBoxBase(radius, height, cornerRadius) {
  sr = (cornerRadius > 1) ? 1 : 0;
  modRadius = (radius * sin(30) - cornerRadius) / sin(30);
  minkowski() {
    cylinder(r = cornerRadius, h = 1, $fn = 40);
    hull() {
      drawTriangle(modRadius, 0, 0, 0); // Bottom
      translate([0, 0, height - sr]) drawTriangle(modRadius, 0, 0, 0); // Top
    }
  }
}

module drawCap(radius, height, z1, z2, z3, crust, drillRadius) {
  union() {
    drawCapBase(radius, height, z1, z2, z3, 0);
    cavityRadius = (radius * sin(30) - crust) / sin(30);
    translate([0, 0, -2]) {
      drawCapBase(cavityRadius, height, 0, 0, 0, drillRadius);
    }
  }
}

module drawCapBase(radius, height, z1, z2, z3, cornerRadius) {
  sr = (cornerRadius > 1) ? 1 : 0;
  modRadius = (radius * sin(30) - cornerRadius) / sin(30);
  minkowski() {
    cylinder(r = cornerRadius, h = 1, $fn = 40);
    hull() {
      drawTriangle(modRadius, 0, 0, 0); // Bottom
      translate([0, 0, height - sr]) drawTriangle(modRadius, z1, z2, z3); // Top
    }
  }
}

module drawTriangle(radius, z1, z2, z3) {
  polyhedron(
    points = [[0, radius, z1], 
              [cos(30)*radius, -sin(30)*radius, z2], 
              [-cos(30)*radius, -sin(30)*radius, z3]], 
    faces = [[0, 1, 2]]
  );
}

// Test modules, check the gaps

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

