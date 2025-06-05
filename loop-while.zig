const std = @import("std");
const print = std.debug.print;
//const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    //var i:u32 = 1;
    //try stdout.print("1 forma\n", .{});
    // 1 forma
    // while (i<1_000_001) {
    //     //try std.io.getStdOut().writer().print("{d} Ok!\r ", .{i});
    //     print("{d} Ok!\r ", .{i});
    //     i += 1;
    // }
    for( 1_000_000,1..)|_,i| {
        //try std.io.getStdOut().writer().print("{d} Ok!\r ", .{i});
        print("{d} Ok!\r ", .{i});
        //i += 1;
    }

    // try stdout.print("\n", .{});
    // try stdout.print("2 forma\n", .{});
    // // 2 forma
    // i = 1;
    // while (i < 5) : (i += 1) {
    //     try stdout.print("{d} | ", .{i});
    // }
    // try stdout.print("\n", .{});
}