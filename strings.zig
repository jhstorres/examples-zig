const std = @import("std");

const str = "Hello world!";

pub fn main() !void {
    std.debug.print("fixed str is: {s}\n", .{str});

    // Stack allocated string
    var stack_allocated: [32]u8 = undefined;
    @memcpy(stack_allocated[0..str.len], str);
    std.debug.print("stack allocated string is: {s}\n", .{stack_allocated});

    // Heap allocated string
    const buffer: []u8 = try std.heap.page_allocator.alloc(u8, str.len);
    defer std.heap.page_allocator.free(buffer); // free after main function

    @memcpy(buffer[0..str.len], str);
    std.debug.print("heap allocated is: {s}\n", .{buffer});
}
