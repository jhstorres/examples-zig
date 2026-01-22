const std = @import("std");

fn fatorial(n: u64) u64 {
    if (n == 0 or n == 1) {
        return 1;
    } else {
        return n * fatorial(n - 1);
    }
}

pub fn main() void {
    const stdout = std.io.getStdOut().writer();
    const n: u64 = 5; // Altere este valor para calcular o fatorial de outro número
    const result = fatorial(n);
    stdout.print("Fatorial de {d} é {d}\n", .{n, result}) catch {};
}