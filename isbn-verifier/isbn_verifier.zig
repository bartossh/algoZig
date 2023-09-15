const ascii = @import("std").ascii;

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) {
        return false;
    }
    var sum: u64 = 0;
    var counter: usize = 0;
    main: for (0..s.len) |idx| {
        if (counter > 9) {
            return false;
        }
        if (!ascii.isDigit(s[idx])) {
            if (s[idx] == 'X' and counter == 9) {
                if (idx == s.len - 1) {
                    sum += 10;
                    break :main;
                }
                return false;
            }
            if (s[idx] == '-' and counter <= 9) {
                continue :main;
            }
            return false;
        }
        if (counter <= 9) {
            sum += @as(u64, s[idx] - '0') * (10 - counter);
            counter += 1;
        }
    }

    return sum % 11 == 0;
}
