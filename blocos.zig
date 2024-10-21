const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var y:i32 = 123;
    const x = label:{     //criamos um bloco nomeado "label"
        y += 1;
        break: label y;       // saimos do bloco retornando um valor
    };

    if(x==124 and y==124){
        try stdout.print("Hey!!!\n", .{});
    }
}