// Convert inches to mm
function inches (x) = x * 25.4;

// Logisaf CM-3P30
// 30A, 3 wires, 600VDC/VAC
module slipRing () {
    color("SlateGray") {
        cylinder(h=47,d=22);
        translate([0,0,-8]) cylinder(h=8,d=10);
        translate([0,0,5]) difference() {
            cylinder(h=3,d=44);
            for (a=[0,120,240]) {
                rotate([0,0,a])
                translate([35/2,0,-0.5])
                cylinder(h=4,d=5.4);
            }
        }
    }
}

module disk (h,d) {
    color("Moccasin")
    difference() {
        cylinder(h=h,d=d);
        translate([0,0,-0.5]) cylinder(h=h+1,d=22);
    }
}

// Shepherd Hardware 9549
// 12in lazy susan, 1000lb load capacity
module bearing () {
    // These dimensions are not known exactly.
    // No technical drawing was available. 
    h=inches(1/4);
    od=inches(12);
    id0=inches(7);
    id1=inches(10);
    color("Silver") difference() {
        cylinder(h=h,d=od);
        translate([0,0,0.5]) cylinder(h=h+5,d=id0);
        translate([0,0,-2]) cylinder(h=h+1,d=id1);
    }
}

module powerStrip () {
    cube([inches(1.97),inches(9.84),inches(1.57)]);
}

module poweredSusan () {
    translate([0,0,8]) 
    disk(h=inches(1), d=inches(24));
    
    slipRing();
    
    translate([0,0,8-inches(1/4)]) bearing();
    
    translate([-inches(1.97)/2,-inches(9.84)/2,50])
    powerStrip();
}
poweredSusan();
