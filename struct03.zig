const std = @import("std");

const Example = struct {
    a: u8, // 1 byte
    b: u32, // 4 bytes
    c: u16, // 2 bytes
};

const Example2 = packed struct {
    a: u8,
    b: u32,
    c: u16,
};

pub fn main() void {
    std.debug.print("size = {}, align = {}\n", .{ @sizeOf(Example), @alignOf(Example) });
    std.debug.print("size = {}, align = {}\n", .{ @sizeOf(Example2), @alignOf(Example2) });
}
