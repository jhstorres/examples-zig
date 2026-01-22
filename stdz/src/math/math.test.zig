const std = @import("std");
const math = @import("math.zig");

const sin = math.sin;
const cos = math.cos;
const tan = math.tan;
const cotan = math.cotan;
const arctan = math.arctan;

test "basic sin func" {
    const value: f32 = (0.0);
    std.debug.print("*** Valores para seno ***\n", .{});
    std.debug.print("PI: {}\n", .{std.math.pi});
    std.debug.print("sin(value): {}\n", .{sin(value)});
    std.debug.print("sin(PI/2) = {}\n", .{sin(std.math.pi / 2.0)});
    std.debug.print("sin(PI/2) - nativo: {}\n", .{@sin(std.math.pi / 2.0)});
    try std.testing.expect(@abs(sin(std.math.pi) / 2.0) - 1.0 < 1e-7);
}

test "basic cos func" {
    const value: f32 = (0.0);
    std.debug.print("*** Valores para coseno ***\n", .{});
    std.debug.print("cos({}): {}\n", .{ value, cos(value) });
    std.debug.print("cos({})(nativo) = {}\n", .{ value, @cos(value) });
    try std.testing.expect(@abs(cos(std.math.pi)) - 1.0 < 1e-7);
}

test "basic tan func" {
    const value: f64 = (std.math.pi / 4.0);
    std.debug.print("*** Valores para tangente ***\n", .{});
    std.debug.print("TAN({})nativo: {}\n", .{ value, @tan(value) });
    std.debug.print("tan({}): {}\n", .{ value, tan(value) });
    //std.debug.print("tan(PI/4): {}\n", .{tan(std.math.pi / 4.0)});
    //std.debug.print("tan(PI) = {}\n", .{@abs(tan(std.math.pi)) - 1.0});
    try std.testing.expect(@abs(tan(std.math.pi)) - 1.0 < 1e-7);
}

test "cotangente func" {
    const value: f64 = std.math.pi / 6.0;
    const result = cotan(value);
    //const expected = std.math.ctan(tangente);
    std.debug.print("*** Valores para Cotangente ***\n", .{});
    //std.debug.print("Tangente({}) = {}\n", .{ value, tangente });
    std.debug.print("Cotan({}) = {}\n", .{ value, result });
    //std.debug.print("Atan nativo ({}) = {}\n", .{ tangente, expected });
    try std.testing.expect(@abs(result - 1.732051) < 1e-6);
}
test "arctan func" {
    const value = std.math.pi / 3.0;
    const tangente = tan(value);
    const result_arctan = math.arctan(tangente);
    //     const result_arctanseries = math.arctanseries(tangente);
    //const expected = std.math.atan(tangente);
    std.debug.print("*** Valores para arco tangente ***\n", .{});
    std.debug.print("Tangente({}) = {}\n", .{ value, tangente });
    std.debug.print("Arctan fast({}) = {}\n", .{ tangente, result_arctan });
    std.debug.print("Angulo calculado = {}\n", .{math.degreesFromRad(result_arctan)});
    //     std.debug.print("Arctan Series({}) = {}\n", .{ tangente, result_arctanseries });
    //std.debug.print("Atan nativo ({}) = {}\n", .{ tangente, expected });
    //std.debug.print("Angulo calculado = {}\n", .{math.degreesFromRad(expected)});

    //try std.testing.expect(@abs(result - expected) < 1e-7);
}

test "pow func" {
    const base: f64 = 2.0;
    const exponent: i32 = -5;
    const result = math.pow(base, exponent);
    //const expected = 1024.0;
    std.debug.print("*** Valores para pow ***\n", .{});
    std.debug.print("{} elevado a {} = {}\n", .{ base, exponent, result });
    //try std.testing.expect(result == expected);
}
