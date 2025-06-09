const std = @import("std");
const stdout = std.io.getStdOut().writer();
// não funcionou utilizando "std.debug.pring()"
pub fn main() !void {
    const a = [_]u8{1,2,3};
    const b:[3]u8 = .{2,4,5};

    // Operadores de Arrays
    const c = a ++ b; // concatena dois arrays
    try stdout.print("c: {any}\n", .{c});
    const d = a ** 2; // replica um array
    try stdout.print("d: {any}\n", .{d});
}