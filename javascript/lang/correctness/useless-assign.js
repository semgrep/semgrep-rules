// ruleid:useless-assignment
var x = 1;

// ruleid:useless-assignment
x = 2;
x = 3;
console.log(x);


// ok:useless-assignment
y = [1, 2];
y = y.map(function(e) { return e * 2; });
console.log(y);

// ok:useless-assignment
z = [1, 2];
z = z.map(e => e * 2);
console.log(z);

// ok:useless-assignment
a = "Hi ";
a += "Mom";

// ok
b = i;
b = f(1, b);

// ok
c = j;
c = f(1, g(c));
