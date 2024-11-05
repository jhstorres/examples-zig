const std = @import("std");

// No caso esta função genérica
// irá retornar um tipo struct{[length]i64}
fn InitArray(comptime length:usize) type{
    return struct{
        items:[length]i64,
    };
}

pub fn main() !void {
    var arr:InitArray(3) = undefined;
    arr.items[0] = 1;
    arr.items[1] = 10;
    arr.items[2] = 100;
    std.debug.print("{any}\n", .{arr.items});
    std.debug.print("{any}\n", .{@TypeOf(arr)});
}