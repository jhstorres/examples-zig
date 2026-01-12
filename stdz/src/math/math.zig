/// Rotinas que fornecem funções trignométricas e capacidade de
/// conversão de caracteres.
/// Autor: José Torres
/// Data: 12/01/2026
/// Versão: 0.1.0
/// Licença: MIT
/// Observação: As funções aqui definidas são inspiradas
/// nas rotinas do Livro C Library e da biblioteca padrão do Zig.
/// Rotinas trigonométricas utilizam a série de Taylor para aproximação.
/// Rotinas para raízes quadradas, cúbicas utilizam o método de Newton-Raphson.
const std = @import("std");

/// Nome: sin(radians)
/// Função: Cálcula o seno de um ângulo em radianos
/// Retorna: valor do seno conforme o tipo numérico de entrada
/// Exemplo: sin(PI/2) retorna aproximadamente 1.0
///
pub inline fn sin(radians: anytype)  @TypeOf(radians){
    comptime var term:@TypeOf(radians) = radians; // Primeiro termo da série
    comptime var sum:@TypeOf(radians) = term; // Inicializa a soma com o primeiro termo
    comptime var n: @TypeOf(radians) = 1;
    const approx = switch(@TypeOf(radians)){
        f16 => 1e-3,
        f32 => 1e-6,
        f64 => 1e-12,
        f80 => 1e-20,
        f128, comptime_float => 1e-30,
        else => @compileError("Tipo não suportado para a função sin"),
    };   

    inline while (@abs(term) > approx) : (n += 1) {
        term *= (-radians * radians) / ((2 * n) * (2 * n + 1));//@as(@TypeOf(radians), @floatFromInt((2 * n) * (2 * n + 1)));
        sum += term;
    }
    return sum;
}

test "basic sin func" {
    const value:f32 = (std.math.pi / 2.0);
    std.debug.print("PI: {}\n", .{std.math.pi});
    std.debug.print("sin(value): {}\n", .{sin(value)});
    std.debug.print("sin(PI/2) = {}\n", .{sin(std.math.pi / 2.0)});
    std.debug.print("sin(PI/2) - nativo: {}\n", .{@sin(std.math.pi / 2.0)});
    try std.testing.expect(@abs(sin(value) - 1.0) < 1e-7);
}
