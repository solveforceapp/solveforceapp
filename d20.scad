include <bitmap.scad>;

phi = (1+ sqrt(5))/2;

scale(20) translate([0, 0, cos(atan((phi - 1) / phi)) * phi]) rotate([0, atan((phi - 1) / phi * 2), 0]) difference() {
	intersection_for(a = [0:4]) rotate([0, 31.75, 72 * a]) intersection_for(r = [[0,0,0],[90,90,0],[90,0,90]]) rotate(r) linear_extrude(height = 10, center = true) polygon(points=[[phi,1],[phi,-1],[0,-phi],[-phi,-1],[-phi,1],[0,phi]], paths=[[0,1,2,3,4,5]]);
	for(n = [1:20]) rotate([180 * (ceil(n / 10) % 2), atan((phi - 1) / phi * 2) + atan((phi - 1) / phi) * 2 * (ceil((n - 5) / 10) % 2), 180 + 72 * n]) translate([0, 0, 1.5 - .1]) scale(0.008) for(d = [0, floor(log(n))]) translate([0, 35 * floor(log(n)) + d * -70, 0]) 8bit_char(str(floor(n % pow(10, d + 1) / pow(10, d))), 10, 100, false);
}