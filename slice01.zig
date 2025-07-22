// You can edit this code!
// Click into the editor and start typing.
const std = @import("std");
const builtin = @import("builtin");
//const expect = @import("std").testing.expect;
const expectEqualSlices = @import("std").testing.expectEqualSlices;
const print = std.debug.print;

pub fn main() void {
    std.debug.print("Hello, {s}! (using Zig version: {})\n", .{ "world", builtin.zig_version });
    
    var array = [_]i32{1, 2, 3, 4};
    var known_at_runtime_zero:usize = 0;
    _ = &known_at_runtime_zero;  //para não ocorrer erro de var muted
    const slice:[]const i32 = array[known_at_runtime_zero..array.len];
    print("slice: {*}\n", .{slice});
    
    //alternative initialization
    const alt_slice:[]const i32 = &.{1, 2, 3, 4};
    print("alt_slice: {*}\n", .{alt_slice});
    
    print("@TypeOf(slice): {}\n", .{@TypeOf(slice)});
    print("@TypeOf(alt_slice): {}\n", .{@TypeOf(alt_slice)});

    print("alt_slice == slice: {any}\n", .{expectEqualSlices(i32, slice, alt_slice)});
}
