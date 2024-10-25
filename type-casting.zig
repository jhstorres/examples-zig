const std = @import("std");
const expect = std.testing.expect;

test "casting 1 - @as" {
    const x:usize= 500;
    const y = @as(u32, x); // faz a conversão de tipo usize -> u32
                                // e atribui o valor de x -> y
    try expect(@TypeOf(y) == u32);
    try expect(y == 500);
}

// Algumas funções de type casting especializadas:
// @intFromFloat()  -> inteiro para float
// @floatFromInt()  -> float para inteiro
// @ptrCast()       -> ponteiros, semelhante ao @floatFromInt()

test "casting 2 - cast int->float" {
    const x: usize = 565;
    const y:f32 = @floatFromInt(x);
    try expect(@TypeOf(y) == f32);
}

test "casting 3 - cast array->ponteiro" {
    const bytes align(@alignOf(u32)) = [_]u8{
        0x12, 0x12, 0x12, 0x12
    };
    const u32_ptr: *const u32 = @ptrCast(&bytes);
    try expect(@TypeOf(u32_ptr) == *const u32);
}