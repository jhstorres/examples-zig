const std = @import("std");
const builtin = @import("builtin");

pub fn main() void {
    std.debug.print("Hello, {s}! (using Zig version: {})\n", .{ "world", builtin.zig_version });
}