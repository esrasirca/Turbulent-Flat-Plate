// Gmsh project created on Sun Dec 24 15:27:38 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0};
Point(2) = {2, 0, 0};
Point(3) = {2, 1, 0};
Point(4) = {0, 1, 0};
Point(5) = {-0.5, 0, 0};
Point(6) = {-0.5, 1, 0};
//+
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 6};
Line(5) = {5, 6};
Line(6) = {1, 4};
Line(7) = {1, 5};
//+
Curve Loop(1) = {6, -3, -2, -1};
Plane Surface(1) = {1};
Curve Loop(2) = {6, 4, -5, -7};
Plane Surface(2) = {2};
//+
Transfinite Surface {1} = {3, 1, 4, 2};  
Transfinite Curve {-3, 1} = 110 Using Progression 1.1; 
Transfinite Curve {6, 2} = 57 Using Progression 1.2; 
Transfinite Surface {2} = {1, 5, 4, 6}; 
Transfinite Curve {6, 5} = 57 Using Progression 1.2; 
Transfinite Curve {4, 7} = 53 Using Progression 1.2; 
//+
Recombine Surface {1, 2};
//+
Physical Curve("inviscid_wall") = {7};
Physical Curve("viscous_wall") = {1};
Physical Curve("freestream") = {5, 4, 3, 2};
//+
Mesh 2;