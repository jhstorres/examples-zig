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
pub inline fn sin(radians: anytype) @TypeOf(radians) {
    comptime var term: @TypeOf(radians) = radians; // Primeiro termo da série
    comptime var sum: @TypeOf(radians) = term; // Inicializa a soma com o primeiro termo
    comptime var n = 1;
    const approx = switch (@TypeOf(radians)) {
        //f16 => 1e-3,
        f32 => 1e-6,
        f64 => 1e-12,
        f80 => 1e-20,
        f128, comptime_float => 1e-30,
        else => @compileError("Não suportado para o tipo " ++ @typeName(@TypeOf(radians))),
    };

    inline while (@abs(term) > approx) : (n += 1) {
        term *= (-radians * radians) / ((2.0 * n) * (2.0 * n + 1.0)); // Calcula o próximo termo
        sum += term;
    }
    return sum;
}

test "basic sin func" {
    const value: f32 = (0.0);
    std.debug.print("PI: {}\n", .{std.math.pi});
    std.debug.print("sin(value): {}\n", .{sin(value)});
    std.debug.print("sin(PI/2) = {}\n", .{sin(std.math.pi / 2.0)});
    std.debug.print("sin(PI/2) - nativo: {}\n", .{@sin(std.math.pi / 2.0)});
    try std.testing.expect(@abs(sin(std.math.pi) / 2.0) - 1.0 < 1e-7);
}

/// Nome: cos(radians)
/// Função: Cálcula o cosseno de um ângulo em radianos
/// Retorna: valor do cosseno conforme o tipo numérico de entrada
/// Exemplo: cos(1) retorna aproximadamente 1.0
///
pub inline fn cos(radians: anytype) @TypeOf(radians) {
    return sin(std.math.pi / 2.0 - radians);
}
test "basic cos func" {
    const value: f32 = (0.0);
    std.debug.print("Valores para coseno:\n", .{});
    std.debug.print("TAN({}): {}\n", .{ value, @tan(std.math.pi / 2.0) });
    std.debug.print("cos({}): {}\n", .{ value, cos(value) });
    std.debug.print("sin({}): {}\n", .{ value, sin(value) });
    std.debug.print("cos(PI) = {}\n", .{@abs(cos(std.math.pi)) - 1.0});
    std.debug.print("cos(PI)(nativo) = {}\n", .{@cos(std.math.pi)});
    try std.testing.expect(@abs(cos(std.math.pi)) - 1.0 < 1e-7);
}

/// Nome: tan(radians)
/// Função: Cálcula a tangente de um ângulo em radianos
/// Retorna: valor da tangente conforme o tipo numérico de entrada
/// Exemplo: tan() retorna aproximadamente 1.0
///
pub inline fn tan(radians: anytype) @TypeOf(radians) {
    const cosine = cos(radians);
    if (@abs(cosine) < 1e-7) @panic("Tangente indefinida para este ângulo");
    return sin(radians) / cosine;
}
test "basic tan func" {
    const value: f32 = (std.math.pi );
    std.debug.print("Valores para tangente:\n", .{});
    std.debug.print("TAN({}): {}\n", .{ value, @tan(value) });
    std.debug.print("tan({}): {}\n", .{ value, tan(value) });
    std.debug.print("tan(PI/4): {}\n", .{tan(std.math.pi / 4.0)});
    std.debug.print("tan(PI) = {}\n", .{@abs(tan(std.math.pi)) - 1.0});
    try std.testing.expect(@abs(tan(std.math.pi)) - 1.0 < 1e-7);
}
