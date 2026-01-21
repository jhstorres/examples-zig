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

/// FUNÇÕES TRIGONOMÉTRICAS
/// Constantes para conversão entre graus e radianos
const rad_per_deg = std.math.rad_per_deg;
const deg_per_rad = std.math.deg_per_rad;

/// Nome: radFromDegrees(ang)
/// Função: Converte o valor de um ângulo(formato decimal) em radianos
/// Retorna: valor em radianos do tipo float - variando conforme o tipo numérico de entrada
/// Exemplo: radFromDegree(90) retorna aproximadamente 1.5708
/// => 90 graus * PI / 180 = 1.5708 radianos
///
pub inline fn radFromDegrees(ang: anytype) if (@TypeOf(ang) == comptime_int) comptime_float else @TypeOf(ang) {
    return ang * rad_per_deg;
}

/// Nome: degreesFromRad(rad)
/// Função: Converte o valor de radianos em um ângulo(formato decimal)
/// Retorna: valor em radianos do tipo float - variando conforme o tipo numérico de entrada
/// Exemplo: degreesFromRad(1.5708) retorna aproximadamente 90.0
/// => 1.5708 radianos * 180 / PI = 90 graus 
///
pub inline fn degreesFromRad(rad: anytype) if (@TypeOf(rad) == comptime_int) comptime_float else @TypeOf(rad) {
    return rad * deg_per_rad;
}

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

/// Nome: cos(radians)
/// Função: Cálcula o cosseno de um ângulo em radianos
/// Retorna: valor do cosseno conforme o tipo numérico de entrada
/// Exemplo: cos(1) retorna aproximadamente 1.0
///
pub inline fn cos(radians: anytype) @TypeOf(radians) {
    return sin(std.math.pi / 2.0 - radians);
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

/// Nome: cotan(radians)
/// Função: Cálcula a cotangente de um ângulo em radianos
/// Retorna: valor da cotangente conforme o tipo numérico de entrada
/// Exemplo: cotan() retorna aproximadamente 1.0
///
pub inline fn cotan(radians: anytype) @TypeOf(radians) {
    const sine = sin(radians);
    if (@abs(sine) < 1e-7) @panic("Cotangente indefinida para este ângulo");
    return cos(radians) / sine;
}


/// Nome: csc(radians)
/// Função: Cálcula a Cosecante de um ângulo em radianos
/// Retorna: valor da cosecante conforme o tipo numérico de entrada
/// Exemplo: csc() retorna aproximadamente 1.0
///
pub inline fn csc(radians: anytype) @TypeOf(radians) {
    const sine = sin(radians);
    if (@abs(sine) < 1e-7) @panic("Cosecante indefinida para este ângulo");
    return 1.0 / sine;
}

/// Nome: sec(radians)
/// Função: Cálcula a Secante de um ângulo em radianos
/// Retorna: valor da secante conforme o tipo numérico de entrada
/// Exemplo: sec() retorna aproximadamente 1.0
///
pub inline fn sec(radians: anytype) @TypeOf(radians) {
    const cosine = cos(radians);
    if (@abs(cosine) < 1e-7) @panic("Secante indefinida para este ângulo");
    return 1.0 / cosine;
}


/// Nome: arctan(radians)
/// Função: Cálcula a arco tangente de uma tangente de um ângulo em radianos ou seja, 
/// o ângulo cujo valor da tangente é igual ao valor fornecido
/// Retorna: valor do ângulo em radianos conforme o tipo numérico de entrada
/// Observação: A função arctan() é definida apenas para valores de tangente diferentes de zero;
/// utiliza a série de Taylor para aproximação.
/// Exemplo: arctan() retorna aproximadamente: 
///
// pub inline fn arctan(radians: anytype) @TypeOf(radians) {
//     const tangent = tan(radians);
//     //std.debug.print("tangente({})->{}\n", .{ radians, tangent });
//     if (@abs(tangent) < 1e-7) @panic("Arco tangente indefinida para este ângulo");
//     return (1.0 / tangent);
// }




// FIM DAS FUNÇÕES TRIGONOMÉTRICAS


// Fim do arquivo math.zig