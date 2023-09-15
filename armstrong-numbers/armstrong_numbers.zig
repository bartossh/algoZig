const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0 or num == 1) {
        return true;
    }

    var digits: usize = 0;
    var temp: u128 = num;
    while (temp != 0) {
        temp /= 10;
        digits += 1;
    }

    var res: u128 = 0;
    var i: u128 = num;
    for (0..digits) |_| {
        var v: u128 = i % 10;
        res += std.math.pow(u128, v, digits);
        i /= 10;
    }

    return res == num;
}
