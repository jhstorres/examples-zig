const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    var i:u8 = 1;
    try stdout.print("1 forma\n", .{});
    // 1 forma
    while (i<5) {
        try stdout.print("{d} | ", .{i});
        i += 1;
    }

    try stdout.print("\n", .{});
    try stdout.print("2 forma\n", .{});
    // 2 forma
    i = 1;
    while (i < 5) : (i += 1) {
        try stdout.print("{d} | ", .{i});
    }
    try stdout.print("\n", .{});
}