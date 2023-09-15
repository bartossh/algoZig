const math = @import("std").math;

pub const ChessboardError = error{
    IndexOutOfBounds,
};

pub fn square(index: usize) ChessboardError!u64 {
    if (index > 64 or index == 0) {
        return ChessboardError.IndexOutOfBounds;
    }
    if (index == 1) {
        return 1;
    }
    if (index == 2) {
        return 2;
    }
    return math.pow(u64, 2, @as(u64, index - 1));
}

pub fn total() u64 {
    var sum: u64 = 0;
    inline for (1..65) |index| {
        sum += square(index) catch 0;
    }
    return sum;
}
