const earthYearSeconds: f64 = 31557600.0;

pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        var sec: f64 = @floatFromInt(seconds);
        var result: f64 = switch (self) {
            .mercury => sec / (0.2408467 * earthYearSeconds),
            .venus => sec / (0.61519726 * earthYearSeconds),
            .earth => sec / earthYearSeconds,
            .mars => sec / (1.8808158 * earthYearSeconds),
            .jupiter => sec / (11.862615 * earthYearSeconds),
            .saturn => sec / (29.447498 * earthYearSeconds),
            .uranus => sec / (84.016846 * earthYearSeconds),
            .neptune => sec / (164.79132 * earthYearSeconds),
        };
        return result;
    }
};
