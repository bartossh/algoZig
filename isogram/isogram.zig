const std = @import("std");

fn isAlpha(c: u8) bool {
    return switch (c) {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' => true,
        else => false,
    };
}

pub fn isIsogram(str: []const u8) bool {
    var unique = std.AutoHashMap(u8, bool).init(std.heap.page_allocator);
    defer unique.deinit();
    var counter: usize = 0;
    for (str) |letter| {
        var small: u8 = std.ascii.toLower(letter);
        if (!isAlpha(small)) {
            continue;
        }
        counter += 1;
        unique.put(small, true) catch |err| {
            if (err == std.mem.Allocator.Error.OutOfMemory) {
                std.debug.print("{s}\n", .{"out of memory error"});
            }

            std.debug.print("{s}\n", .{"unexpected error"});
            return false;
        };
    }

    return counter == unique.count();
}
