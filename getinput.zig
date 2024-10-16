const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn();
    const reader = stdin.reader();

    var buffer: [1024]u8 = undefined;

    std.debug.print("What's your name?\n", .{});

    const result = try reader.readUntilDelimiterOrEof(&buffer, '\n');
    if (result) |value| {
        std.debug.print("You entered: {s}\n", .{value});
    } else {
        std.debug.print("Something went wrong, value is null!\n", .{});
    }
}
