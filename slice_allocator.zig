const std = @import("std");
const builtin = @import("builtin");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var n:usize = 0;
    const stdout = std.io.getStdOut().writer();
    
    if(builtin.target.os.tag == .windows){
        n = 10;
    } else {
        n = 12;
    }

    try stdout.print("n: {}\n", .{n});

    const buffer = try allocator.alloc(u64, n);
    const slice = buffer[0..];
    _ = slice;

}