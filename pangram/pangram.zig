const std = @import("std");

fn isAlpha(c: u8) bool {
    return switch (c) {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' => true,
        else => false,
    };
}

pub fn isPangram(str: []const u8) bool {
    const allocator = std.heap.page_allocator;
    var unique = std.AutoHashMap(u8, bool).init(
        allocator,
    );
    defer unique.deinit();
    for (str) |l| {
        var c: u8 = std.ascii.toLower(l);
        if (!isAlpha(c)) {
            continue;
        }
        unique.put(c, true) catch |err| {
            if (err == std.mem.Allocator.Error.OutOfMemory) {
                std.debug.print("{s}\n", .{"out of memory error"});
            }

            std.debug.print("{s}\n", .{"unexpected error"});
            return false;
        };
    }
    var len: usize = unique.count();
    return len == 26;
}
