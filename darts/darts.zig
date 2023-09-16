const math = @import("std").math;

pub const Coordinate = struct {
    x_coord: f32,
    y_coord: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x_coord = x_coord, .y_coord = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        var distance: f32 = math.sqrt(math.pow(f32, self.x_coord, 2) + math.pow(f32, self.y_coord, 2));
        if (distance <= 1.0) {
            return 10;
        }
        if (distance <= 5.0) {
            return 5;
        }
        if (distance <= 10.0) {
            return 1;
        }
        return 0;
    }
};
