const std = @import("std");

pub fn main() void {
    var user = User{    
        .id = 1,
        .power = 100,
    };

    std.debug.print("main: {*}\n", .{&user});

    //levelUp(user); // Os paramêtros de uma função são CONSTANTES, *isto não compila
    //levelUp(&user); // Os paramêtros de uma função são CONSTANTES, *isto não compila
    user.levelUp();// chamando um metodo. Zig entende que o metodo espera um ponteiro - que seria o self
    std.debug.print("User {d} has power of {d}\n", .{ user.id, user.power });
}

// Para modificar os valores do User, é necessário o uso de ponteiros - fazendo uma
// passagem por referência.
// Por padrão, o paramêtros de uma função, são passados por valor.
// fn levelUp(user: User) void {
//     user.power += 1;
// }

// essa função seria melhor escrita como um metodo para a struct User
// fn levelUp(user: *User) void {
//     user.power += 1;
// }


// Considerações:
// o Zig não faz garantias sobre o layout de memória das estruturas. Isso permite 
// otimizações pelo compilador
// Se utilizarmos:
// packed struct -> teremos fortes garantias sobre o layout da memória
// extern struct -> teremos o que garante que o layout da memória corresponderá a C (ABI)
pub const User = struct {
    id: u64,
    power: i32,

    // metodo para a função acima
    fn levelUp(user: *User) void {
        std.debug.print("{*}\n{*}\n", .{&user, user});
        user.power += 1;
    }
};
