const std = @import("std");
const libzig = @import("root.zig");

test "basic add functionality" {
    try std.testing.expect(libzig.add(3, 7) == 10);
}

test "basic percent func" {
    try std.testing.expect(libzig.percent(5.5, 10) == 55.0);
}

test "basic max func" {
    try std.testing.expect(libzig.max(5, 10) == 10);
}

test "basic min func" {
    try std.testing.expect(libzig.min(5, 10) == 5);
}

test "basic is_odd func" {
    try std.testing.expect(libzig.is_odd(-2) == true);
}

test "basic is_even func" {
    try std.testing.expect(libzig.is_even(3) == true);
}

test "basic factorial func" {
    try std.testing.expect(comptime libzig.factorial(5) == 120);
}
