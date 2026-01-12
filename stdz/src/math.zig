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
/// Retorna: valor do seno como f64
/// Exemplo: sin(PI/2) retorna aproximadamente 1.0
///
pub fn sin(radians: f64) f64 {
    var term: f64 = radians; // Primeiro termo da série
    var sum: f64 = term; // Inicializa a soma com o primeiro termo
    var n: u32 = 1;

    while (@abs(term) > 1e-10) : (n += 1) {
        term *= (-radians * radians) / @as(f64, ((2 * n) * (2 * n + 1)));
        sum += term;
    }
    return sum;
}
test "basic sin func" {
    try std.testing.expect(@abs(sin(std.math.pi / 2.0) - 1.0) < 1e-10);
}
