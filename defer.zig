// Com o "defer" você pode registrar uma expressão a 
// ser executada quando você sair do escopo atual
// independente da causa (seja erro, return, break ...)
// Exemplo

const std = @import("std");
const stdout = std.io.getStdOut().writer();

// fn foo() !void{
//     // essa funcao só será executada quando sairmos do
//     // escopo da funcao foo()
//     defer std.debug.print("Exitig function ...\n", .{});

//     try stdout.print("Adding some numbers ...\n", .{});
//     const x = 2 + 2; _ = x;
//     try stdout.print("Multiplying ...\n", .{});
//     const y = 2 * 8; _ = y;

// }

// pub fn main() !void{
//     try foo();
// }


// Exemplo com "defer" e "errdefer"
// defer -> é incondicional, executa ao sair do escopo
// errdefer -> é condicional, executa se sair do escopo com erro
// são executadas em LIFO (último que entra, primeiro que sai)

fn foo() !void{ return error.FooError;}
pub fn main()!void{
    var i:usize = 1;
    errdefer std.debug.print("Value of i: {d}\n", .{i});
    defer i = 2;
    try foo();
    // executa o "defer" primeiro e depois o "errdefer"
    // em modo LIFO
}