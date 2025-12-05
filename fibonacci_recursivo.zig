// Fibonacci em estrutura recursiva
// Gerando a série em tempo de compilação

const std = @import("std");
const print = std.debug.print;

fn generateFibonacci(comptime n: usize) [n]u64 {
    @setEvalBranchQuota(10000);
    comptime var fib: [n]u64 = undefined;
    comptime var i: usize = 0;
    inline while (i < n) : (i += 1) {
        fib[i] = switch (i) {
            0 => 0,
            1 => 1,
            else => fib[i - 1] + fib[i - 2],
        };
    }
    return fib;
}

fn comptime_fibonacci(n: usize) u64 {
    // @setEvalBranchQuota(100_000_000);
    // if(n < 2) return n;
    // return comptime_fibonacci(n - 1) + comptime_fibonacci(n - 2);
   
    const fib    = comptime generateFibonacci(n+1);
    return fib[n];
}

pub fn main() !void {
    const n: usize = 41; // gera os primeiros 40 (de 0 à 40) números de Fibonacci
    const fib = generateFibonacci(n);
    var i: usize = 0;

    print("Fibonacci sequence up to {} terms:\n", .{n});
    for (fib) |value| {
        print("Fib({}): {}\n", .{ i, value });
        i += 1;
    }

    const j = 50;
    const f = comptime comptime_fibonacci(j) ;
    print("\nComptime Fibonacci for {}: {}\n", .{ j, f });
}
