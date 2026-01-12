const std = @import("std");

fn print_value(comptime T: type, value: T) void {
    if (@TypeOf(value) == i32) {
        std.debug.print("Integer: {d}\n", .{value});
    } else if (@TypeOf(value) == f64) {
        std.debug.print("Float: {d}\n", .{value});
    } else {
        std.debug.print("Unknown type\n", .{});
    }
}

pub fn main() void {
    print_value(i32, 42);
    print_value(f64, 3.14);
    print_value(bool, true);
}
