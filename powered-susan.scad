function inches (x) = x * 25.4;

module slipRing () {
    cylinder(h=47,d=22);
    translate([0,0,5]) difference() {
        cylinder(h=3,d=44);
        for (a=[0,120,240]) {
            rotate([0,0,a])
            translate([35/2,0,-0.5])
            cylinder(h=4,d=5.4);
        }
    }
    translate([0,0,-8]) cylinder(h=8,d=10);
}

module disk (h,d) {
    difference() {
        cylinder(h=h,d=d);
        translate([0,0,-0.5]) cylinder(h=h+1,d=22);
    }
}

module bearing () {
    h=inches(1/4);
    od=inches(12);
    id0=inches(7);
    id1=inches(10);
    difference() {
        cylinder(h=h,d=od);
        translate([0,0,-0.5]) cylinder(h=h+1,d=id0);
        translate([0,0,-2]) cylinder(h=h+1,d=id1);
    }
}

translate([0,0,8]) disk(h=inches(1), d=inches(24));
slipRing();
bearing();