const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    const name = [_]u8{'P','e', 'd', 'r', 'o'};
    // for(name) |char|{
    //     try stdout.print("{d} | ", .{char});
    // }

    // ou com dois operadores
    for(name, 0..) |_, i|{
        try stdout.print("{d} | ", .{i});
    }
    try stdout.print("\n", .{});
}