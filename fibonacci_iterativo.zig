// fibonacci_iterativo.zig
const std = @import("std");

const print = std.debug.print;
//const print = std.io.getStdOut().writer().print;

/// Calcula o n-ésimo número de Fibonacci de forma iterativa.
///
/// Argumentos:
///   n: O índice do número de Fibonacci a ser calculado (n >= 0).
///
/// Retorna:
///   O n-ésimo número de Fibonacci.
///
/// Observação: Use u64 para suportar números maiores, pois a sequência cresce rapidamente.
///             u32 pode causar overflow para n > ~47.
pub fn fibonacci_iterativo(n: u64) u128 {
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }

    var a: u128 = 0;
    var b: u128 = 1;

    // Começa de 2 porque 0 e 1 já foram tratados
    var i: u64 = 2;
    while (i <= n) : (i += 1) { 
        // : (i += 1) é a "post-expression", executada após cada iteração
        // Usamos um temporário para evitar sobrescrever 'a' antes de usá-lo em 'b'
        const proximo = a + b;
        a = b;
        b = proximo;
    }

    return b; // 'b' conterá o F(n) após o loop
}

/// Função principal para testar as implementações.
pub fn main() !void {

    print("--- Fibonacci Iterativo ---\n", .{});
    for (0..90) |i| {
        print("F({d}) = {d}\n", .{ i, fibonacci_iterativo(i) });
    }

    // Exemplo para um número maior, se o tipo de dado permitir
    print("F(90) = {d}\n", .{fibonacci_iterativo(90)}); // Descomente para testar, u64 aguenta até F(93)
}