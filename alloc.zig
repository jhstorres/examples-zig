const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void{
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const nome = "Pedro";
    const output = try std.fmt.allocPrint(allocator, "Hello {s}!!!", .{nome});
    //defer allocator.free(output);

    try stdout.print("{s}\n", .{output});
}

// pub fn main() !void{
//     var gpa = std.heap.GeneralPurposeAllocator(.{}){};
//     const allocator = gpa.allocator();
//     const some_number = try allocator.create(u32);
//     defer allocator.destroy(some_number);

//     some_number.* = @as(u32, 45);
//     try stdout.print("{d}\n", .{some_number});
// }
