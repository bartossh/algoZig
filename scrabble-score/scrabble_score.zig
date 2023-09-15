const ascii = @import("std").ascii;

fn getPoints(c: u8) u32 {
    return switch (c) {
        'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => 1,
        'D', 'G' => 2,
        'B', 'C', 'M', 'P' => 3,
        'F', 'H', 'V', 'W', 'Y' => 4,
        'K' => 5,
        'J', 'X' => 8,
        'Q', 'Z' => 10,
        else => 0,
    };
}

pub fn score(s: []const u8) u32 {
    var res: u32 = 0;
    for (s) |l| {
        res += getPoints(ascii.toUpper(l));
    }
    return res;
}
