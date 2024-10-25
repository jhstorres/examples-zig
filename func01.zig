const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn add2(x:*u32) void {
    const d:u32 = 2;
    x.* = x.* + d;
}

pub fn main() !void {
    var x:u32 = 4;
    add2(&x);
    try stdout.print("Result: {d}\n", .{x});
}