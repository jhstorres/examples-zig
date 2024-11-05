const std = @import("std");

// mesmo tipo da generics02.zig
// adicionando um metodo construtor: init()
// que retorna o tipo: InitArray(3)
// se tivessemos um InitArray(7) este seria um tipo diferente
fn InitArray(comptime length:usize) type{
    return struct {
        items: [length]i64,
        
        fn init() InitArray(length){
            return .{
                .items = undefined,
            };
        }
    };
}

pub fn main() !void {
    var arr = InitArray(3).init();
    arr.items[0] = 1;
    arr.items[1] = 10;
    arr.items[2] = 100;
    std.debug.print("{any}\n", .{arr.items});
}