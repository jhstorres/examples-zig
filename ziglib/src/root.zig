//! By convention, root.zig is the root source file when making a library.
const std = @import("std");
const DivisionByZero = error.DivisionByZero;

pub fn bufferedPrint() !void {
    // Stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try stdout.flush(); // Don't forget to flush!
}

pub export fn add(a: i32, b: i32) i32 {
    return a + b;
}

//Nome: percent(x, y)
//Função: retorna a porcentual de x sobre y
pub fn percent(x: f32, y: f32) !f32 {
    if (y == 0) {
        return DivisionByZero;
    }
    return 100 * (x / y);
}

//Nome: max(x, y)
//Função: retorna o valor máximo entre x e y
pub fn max(a: i32, b: i32) i32 {
    comptime if (a > b) {
        return a;
    } else return b;
}

//Nome: min(x, y)
//Função: retorna o valor mínimo entre x e y
pub fn min(a: i32, b: i32) i32 {
    if (a > b) return a else return b;
    // if (a > b) {
    //     return b;
    // } else return a;
}

//Nome: is_odd(x)
//Função: retorna "true" se o valor de x é par
pub export fn is_odd(x: u32) bool {
    if (@rem(@abs(x), 2) == 1) {
        return false;
    } else return true;
}

//Nome: is_even(x)
//Função: retorna "true" se o valor de x é impar
pub fn is_even(x: u32) bool {
    if (@rem(@abs(x), 2) == 1) {
        return true;
    } else return false;
}

pub fn factorial(n: u64) u64 {
    if (n == 0) {
        return 1;
    }
    return n * factorial(n - 1);
}
