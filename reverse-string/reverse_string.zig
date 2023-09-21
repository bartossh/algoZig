const mem = @import("std").mem;

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (0..s.len) |i| {
        buffer[s.len - 1 - i] = s[i];
    }
    return buffer;
}
