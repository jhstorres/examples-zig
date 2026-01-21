const std = @import("std");

pub fn main() !void {
    const x: f64 = 3.14159265358979323846;

    const ux: u64 = @bitCast(x);
    const ix: u32 = @intCast(ux >> 32);
    const lx: u32 = @intCast(ux & 0xFFFFFFFF);

    std.debug.print("x: {}\n", .{x});
    std.debug.print("ux: {}\n", .{ux});
    std.debug.print("ix: {}\n", .{ix});
    std.debug.print("lx: {}\n", .{lx});
}
