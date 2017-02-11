resolution = 50; // 10; don't increase too much, or you'll get performance issues
wall = 8;
leg = 50.7;
support = false;

xoffset = (leg+(wall-2))/2+1.1;
zoffset = 50;

rotate([0,180,0]) difference() {
	union() {
		minkowski() {
			union() {
				translate([0,0,-10]) cube([leg+(wall-2),leg+(wall-2),140], center=true);
				
				if (support) {
                    translate([-13,0,-50]) cube([40,40,14], center=true);
                    translate([0,-13,-50]) cube([40,40,14], center=true);
                }
			}
			sphere(r=2, $fn=resolution, center=true);
		}
			
		// holder nub
		//translate([0,-xoffset2,-zoffset-20]) cube([2,2,1.8]);
	}
	
	translate([0,0,45+35]) minkowski() {
		cube([leg-3.5,leg-3.5,90], center=true);
		sphere(r=2, $fn=resolution, center=true);
	}
	
	translate([3,3,-(45+35)]) minkowski() {
		cube([leg+4,leg+4,90], center=true);
		sphere(r=2, $fn=resolution, center=true);
	}
	
	translate([-xoffset,0,zoffset]) rotate([0,90,0]) cylinder(h=10, d=6, $fn=resolution, center=true);
	translate([-xoffset,0,-zoffset-20]) rotate([0,90,0]) cylinder(h=10, d=6, $fn=resolution, center=true);
	translate([0,-xoffset,zoffset]) rotate([90,0,0]) cylinder(h=10, d=6, $fn=resolution, center=true);
	translate([0,-xoffset,-zoffset-20]) rotate([90,0,0]) cylinder(h=10, d=6, $fn=resolution, center=true);

	xoffset2 = (leg+(wall-2))/2+2.8;
	translate([-xoffset2,0,zoffset]) rotate([0,-90,0]) cylinder(h=4, d1=12, d2=18, $fn=resolution, center=true);
	translate([-xoffset2,0,-zoffset-20]) rotate([0,-90,0]) cylinder(h=4, d1=12, d2=18, $fn=resolution, center=true);
	translate([0,-xoffset2,zoffset]) rotate([90,0,0]) cylinder(h=4, d1=12, d2=18, $fn=resolution, center=true);
	translate([0,-xoffset2,-zoffset-20]) rotate([90,0,0]) cylinder(h=4, d1=12, d2=18, $fn=resolution, center=true);
}