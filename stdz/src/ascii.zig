//! By convention, root.zig is the root source file when making a library.
const std = @import("std");

// pub fn bufferedPrint() !void {
//     // Stdout is for the actual output of your application, for example if you
//     // are implementing gzip, then only the compressed bytes should be sent to
//     // stdout, not any debugging messages.
//     var stdout_buffer: [1024]u8 = undefined;
//     var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
//     const stdout = &stdout_writer.interface;

//     try stdout.print("Run `zig build test` to run the tests.\n", .{});

//     try stdout.flush(); // Don't forget to flush!
// }

//Nome: add(type, valor 1, valor 2) retorna um type
//Função: retorna a soma entre valor 1 e valor 2 com o mesmo type/tipo
//usando comptime do tipo type posso passar quaisquer tipo
//para os parametros e para o retorno
pub fn add(comptime T: type, a: T, b: T) T {
    return a + b;
}
test "basic add functionality" {
    try std.testing.expect(add(u32, 3, 7) == 10);
}

//Nome: percent(x, y)
//Função: retorna a porcentual de x sobre y
//usando comptime do tipo type posso passar quaisquer tipo
//para os parametros e para o retorno
inline fn percent(comptime T: type, x: T, y: T) T {
    return 100 * (x / y);
}
test "basic percent func" {
    try std.testing.expect(percent(f32, 5.5, 10) == 55.0);
}

//Nome: max(x, y)
//Função: retorna o valor máximo entre x e y
//usando comptime do tipo type posso passar quaisquer tipo
//para os parametros e para o retorno
pub fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}
test "basic max func" {
    try std.testing.expect(max(u32, 5, 10) == 10);
}

//Nome: min(x, y)
//Função: retorna o valor mínimo entre x e y
//usando comptime do tipo type posso passar quaisquer tipo
//para os parametros e para o retorno
pub fn min(comptime T: type, a: T, b: T) T {
    return if (a > b) b else a;
}
test "basic min func" {
    try std.testing.expect(min(u32, 5, 10) == 5);
}

//Nome: is_odd(x)
//Função: retorna "true" se o valor de x é par
//usando comptime do tipo type posso passar quaisquer tipo
//para os parametros.
pub fn is_odd(comptime T: type, x: T) bool {
    return if (@rem(@abs(x), 2) == 1) false else true;
}
test "basic is_odd func" {
    try std.testing.expect(is_odd(i32, -2) == true);
}

//Nome: is_even(u32, x) => true or false
//Função: retorna "true" se o valor de x é impar
//usando comptime do tipo type posso passar quaisquer tipo
//para os parametros.
pub fn is_even(comptime T: type, x: T) bool {
    return if (@rem(@abs(x), 2) == 1) true else false;
}
test "basic is_even func" {
    try std.testing.expect(is_even(i32, -2) == false);
}

//Nome: round_off(f32, x) => se x>= 0.5 retorna 1 senão retorna 0
//Função: Entrar com paramentro do tipo flutuante e retorna um tipo
//com o valor inteiro arredondado conforme regra acima.
//Observação: usando comptime do tipo type posso passar quaisquer tipo float
//para os parametros e retornado.
inline fn round_off(x: comptime_float) comptime_int {
    return @intFromFloat(x + 0.5);
}
test "basic round_off func" {
    try std.testing.expect(round_off(1.55) == 2);
}

//Nome: is_uppercase(x) => se x>= A e x<= Z retorna true senão retorna false
//Função: Verifica se a letra em x é MAIÚSCULA
//Retorna: se sim true senão false.
//Observação: .
inline fn is_uppercase(x: u8) bool {
    return if (x >= 'A' and x <= 'Z') true else false;
}
test "basic is_uppercase func" {
    try std.testing.expect(is_uppercase('H') == true);
}

//Nome: is_lowercase(x) => se x>= a e x<= z retorna true senão retorna false
//Função: Verifica se a letra em x é MINÚSCULA
//Retorna: se sim true senão false.
//Observação: .
inline fn is_lowercase(x: u8) bool {
    return if (x >= 'a' and x <= 'z') true else false;
}
test "basic is_lowercase func" {
    try std.testing.expect(is_lowercase('m') == true);
}

//Nome: is_blank(x) => se x = ' ' retorna true senão retorna false
//Função: Verifica se a letra em x é um espaço em branco
//Retorna: se sim true senão false.
//Observação: .
inline fn is_blank(x: u8) bool {
    return if (x == ' ') true else false;
}
test "basic is_blank func" {
    try std.testing.expect(is_blank(' ') == true);
}

//Nome: is_digit(x) => se x >= 0 e x <= 9 retorna true senão retorna false
//Função: Verifica se x está entre 0 e 9
//Retorna: se sim true senão false.
//Observação: .
inline fn is_digit(x: u8) bool {
    return if (x >= '0' and x <= '9') true else false;
}
test "basic is_digit func" {
    try std.testing.expect(is_digit('7') == true);
}

//Nome: is_binary(x) => se x='0' ou x='1' retorna true senão retorna false
//Função: Verifica se x é binário e é 0 ou 1
//Retorna: se sim true senão false.
//Observação: .
inline fn is_binary(x: u8) bool {
    return if (x == '0' or x == '1') true else false;
}
test "basic is_binary func" {
    try std.testing.expect(is_binary('1') == true);
}

//Nome: is_control(x) => se x > 0 e x < 32 retorna true senão retorna false
//Função: Verifica se x é um char de controle e está entre 0 e 32
//Retorna: se sim true senão false.
//Observação: .
inline fn is_control(x: u8) bool {
    return if (x > 0 and x < 32) true else false;
}
test "basic is_control func" {
    try std.testing.expect(is_control(7) == true);
}

//Nome: to_lowercase(x) => se x == maiúscula => x+'a'-'A' retorna x
//Função: Verifica se a letra em x é MAIÚSCUAL executa a condição acima
//Retorna: transforma em MINÚSCULA.
//Observação: .
inline fn to_lowercase(x: u32) u32 {
    return if (is_uppercase(x)) (x + 'a' - 'A') else x;
}
test "basic to_lowercase func" {
    try std.testing.expect(to_lowercase('T') == 't');
}

//Nome: to_uppercase(x) => se x == minúscula => x+'a'-'A' retorna x
//Função: Verifica se a letra em x é MINÚSCULA executa a condição acima
//Retorna: transforma em MAIÚSCULA.
//Observação: .
inline fn to_uppercase(x: u32) u32 {
    return if (is_lowercase(x)) (x - 'a' + 'A') else x;
}
test "basic to_uppercase func" {
    try std.testing.expect(to_uppercase('r') == 'R');
}

//Nome: to_decimal(x) => se x is_digit => x - '0' senão retorna 0
//Função: Verifica se em x é DIGITO executa a condição acima
//Retorna: transforma em DECIMAL.
//Observação: .
inline fn to_decimal(x: u8) comptime_int {
    return if (is_digit(x)) (x - '0') else 0;
}
test "basic to_digital func" {
    try std.testing.expect(to_decimal('6') == 6);
}

//Nome: to_ascii(x) => se x>=0 e x<=9 => x + '0' senão retorna 0
//Função: Verifica se em x é DIGITO executa a condição acima
//Retorna: transforma em DECIMAL.
//Observação: .
inline fn to_ascii(x: u8) u8 {
    return if (x >= 0 and x <= 9) x + '0' else 0;
}
test "basic to_ascii func" {
    try std.testing.expect(to_ascii(6) == '6');
}
