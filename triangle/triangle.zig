pub const TriangleError = error{
    Invalid,
};

pub const Triangle = struct {
    a: f64,
    b: f64,
    c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        var eq0: bool = a + b - c > 0.0;
        var eq1: bool = b + c - a > 0.0;
        var eq2: bool = c + a - b > 0.0;
        if (a > 0.0 and b > 0.0 and c > 0.0 and eq0 and eq1 and eq2) {
            return Triangle{ .a = a, .b = b, .c = c };
        }
        return TriangleError.Invalid;
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.a == self.b and self.b == self.c and self.c == self.a;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return self.a == self.b or self.b == self.c or self.c == self.a;
    }

    pub fn isScalene(self: Triangle) bool {
        return self.a != self.b and self.b != self.c and self.c != self.a;
    }
};
