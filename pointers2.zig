// Exemplo com estruturas recursivas
// Estruturas recursivas com uso de pointers
//
const std = @import("std");

pub const User = struct{
    id: u64,
    power: u32,
    // faz recursividade 
    manager: ?*const User,
};


pub fn main()!void{
    const leto = User{
        .id = 1,
        .power = 9001,
        .manager = null,
    } ;
    const duncan = User{
        .id = 2,
        .power = 8001,
        .manager = &leto,
    };

    std.debug.print("{any}\n{any}\n", .{leto, duncan});
}