const std = @import("std");

// This example demonstrates a simple loop using comptime evaluation in Zig.
pub fn main() !void {
    @setEvalBranchQuota(1_000_000);
    comptime var i = 0;
    inline while (i < 1_000) : (i += 1) {
        std.debug.print("Iteration: {}\r", .{i});
    }
}
