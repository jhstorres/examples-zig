/// Rotinas que fornecem funções trignométricas e capacidade de
/// conversão de caracteres.
/// Autor: José Torres
/// Data: 12/01/2026
/// Versão: 0.1.0
/// Licença: MIT
/// Observação: As funções aqui definidas são inspiradas
/// nas rotinas do Livro "Bibliotecas C Library - Kris Jamsa" e da biblioteca padrão do Zig.
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
/// Observação: 
/// 1.A função arctan() é definida apenas para valores de tangente diferentes de zero;
/// 2.A princípio utilizamos a função com base no livro "Bibliotecas C Library - Kris Jamsa",
/// mas este possue um erro conceitual para o cálculo (visto abaixo);
/// 3.Utilizamos então a função com base na aproximação pela série de Taylor;
/// 4.Utilizamos a expansão em série de Taylor para valores absolutos menores que 1;
/// 5.Utilizamos identidades trigonométricas para valores absolutos maiores que 1;
/// 6.A série de Taylor utilizada é a seguinte:
///    arctan(x) = x - (x^3)/3 + (x^5)/5 - (x^7)/7 + ... para |x| <= 1
/// 7.Para |x| > 1, utilizamos as identidades:
///    arctan(x) = π/2 - arctan(1/x) para x > 0
///    arctan(x) = -π/2 - arctan(1/x) para x < 0
/// 8.A série é truncada quando o valor absoluto do termo atual é menor que uma aproximação
///   definida conforme o tipo numérico de entrada;
/// 9.Fonte de consulta: https://pt.wikipedia.org/wiki/S%C3%A9rie_de_Taylor e o CHAT GPT-4.
/// 
/// Retorna: valor do ângulo
/// Exemplo: arctan() retorna aproximadamente:
/// Função publicada no livro "Bibliotecas C Library - Kris Jamsa":
// pub inline fn arctan(radians: anytype) @TypeOf(radians) {
//     const tangent = tan(radians);
//     //std.debug.print("tangente({})->{}\n", .{ radians, tangent });
//     if (@abs(tangent) < 1e-7) @panic("Arco tangente indefinida para este ângulo");
//     return (1.0 / tangent);
// }
pub fn arctan(x:anytype) @TypeOf(x) {
    if (@abs(x) > 1.0) {
        if (x > 0.0) {
            return std.math.pi / 2.0 - arctanseries(1.0 / x);
        } else {
            return -std.math.pi / 2.0 - arctanseries(1.0 / x);
        }
    }    
    if(@abs(x) < 0.5) {
        return arctanseries(x);
    }
    if(x > 0.0) {
        const y = (x - 1.0) / (x + 1.0);
        return std.math.pi / 4.0 + arctanseries(y);
    } else {
        const y = (x + 1.0) / (1.0 - x);
        return -std.math.pi / 4.0 + arctanseries(y);
    }    
}

inline fn arctanseries(x: anytype) @TypeOf(x) {
    var term: @TypeOf(x) = x; // Primeiro termo da série
    var sum: @TypeOf(x) = term; // Inicializa a soma com o primeiro termo
    var n:@TypeOf(x) = 1.0;
    const approx = switch (@TypeOf(x)) {
        //f16 => 1e-3,
        f32 => 1e-6,
        f64 => 1e-12,
        f80 => 1e-20,
        f128, comptime_float => 1e-30,
        else => @compileError("Não suportado para o tipo " ++ @typeName(@TypeOf(x))),
    };
    while (@abs(term) > approx): (n += 1.0) {
        term *= (-x * x) * (2.0 * n - 1.0) / (2.0 * n + 1.0); // Calcula o próximo termo
        sum += term;
    }
    return sum;
}

// FIM DAS FUNÇÕES TRIGONOMÉTRICAS

// FUNÇÕES ARITMÉTICAS
/// Nome: fatorial(number)
/// Função: Calcula o fatorial de um número inteiro não negativo
/// Retorna: valor do fatorial conforme o tipo numérico de entrada
/// Exemplo: fatorial(5) retorna 120
pub inline fn fatorial(number: anytype) @TypeOf(number) {
    if (number == 0 or number == 1) {
        return 1;
    } else {
        return number * fatorial(number - 1);
    }
}


/// Nome: pow(number, exponent)
/// Função: Calcula a potência de um número elevado a outro
/// Retorna: valor da potência conforme o tipo numérico de entrada
/// Observação: 
/// 1.O expoente pode ser inteiro negativo, zero ou positivo;
/// 2.Se o expoente for negativo, o resultado será o inverso da potência com
/// expoente positivo;
/// 3.Se o expoente for zero, o resultado será 1;
/// 4.Se o expoente for positivo, o resultado será o produto do número por ele
/// mesmo, repetido o número de vezes indicado pelo expoente;
/// 5.A função é implementada utilizando um loop para multiplicação recursiva;
/// 
/// FONTE: CHAT GPT-4.
/// Retorna: valor da potência conforme o tipo numérico de entrada.
/// Exemplo: pow(2, 3) retorna 8
pub inline fn pow(number: anytype, exponent: i32) @TypeOf(number) {
    if (exponent == 0) {
        return 1;
    } else if (exponent == 1) {
        return number;
    } else if (exponent < 0) {
        return 1.0 / pow(number, -exponent);
    } else {
        var result = number;
        var i = @as(@TypeOf(exponent), 1);
        while (i < exponent) : (i += 1) {
            result *= number;
        }
        return result;
    }
}

// FIM DAS FUNÇÕES ARITMÉTICAS
// Fim do arquivo math.zig