// ruleid:useless-assignment
var x1 = 1;
x1 = 2;

// ruleid:useless-assignment
let x2 = 1;
x2 = 2;

// ruleid:useless-assignment
x3 = 1;
x3 = 2;

// ok:useless-assignment
x4 = {value1: 42};
x4 = {x4, value2: 43};

// ok:useless-assignment
x5 = {value1: 42};
x5 = {...x5, value2: 43};

// ok:useless-assignment
y = [1, 2];
y = y.map(function(e) { return e * 2; });

// ok:useless-assignment
z = [1, 2];
z = z.map(e => e * 2);

// ok:useless-assignment
a = "Hi ";
a += "Mom";

// ok:useless-assignment
b = i;
b = f(1, b);

// ok:useless-assignment
c = j;
c = f(1, g(c));
