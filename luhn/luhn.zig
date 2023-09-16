const ascii = @import("std").ascii;

pub fn isValid(s: []const u8) bool {
    if (s.len <= 1) {
        return false;
    }
    var counter: usize = 0;
    var sum: usize = 0;
    for (0..s.len) |idx| {
        var i: usize = s.len - idx - 1;
        if (ascii.isDigit(s[i])) {
            counter += 1;
            var num: u8 = s[i] - '0';
            if (counter % 2 == 0) {
                num *= 2;
                if (num > 9) {
                    num -= 9;
                }
            }
            sum += @as(usize, num);
            continue;
        }
        if (s[i] != ' ') {
            return false;
        }
    }
    if (counter <= 1) {
        return false;
    }
    return sum % 10 == 0;
}
