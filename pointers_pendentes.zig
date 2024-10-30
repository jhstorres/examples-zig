const std = @import("std");

pub fn main() void {
    const user1 = User.init(1,10);
    const user2 = User.init(2,20);

    std.debug.print("User {d} has power of {d}\n", .{user1.id, user1.power});
    std.debug.print("User {d} has power of {d}\n", .{user2.id, user2.power});
}

pub const User = struct{
    id:u64,
    power:u32,
    
    // retorna um endereço de um objeto local à função que 
    // o que ocasiona um erro denominado: dangling pointers
    // qdo a função "init" é retirada da stack, quaisquer referencias a 
    // objetos locais dessa memória é inválida:
    // fn init(id:u64, power:u32) *User{
    //     const user = User{
    //         .id = id,
    //         .power = power,
    //     };
    //     return &user;  
    // }

    // A solução aqui é não usar endereçamento. Mas isso nem sempre é possível
    // outra solução é utilizar a HEAP.
    fn init(id:u64, power:u32) User{
        const user = User{
            .id = id,
            .power = power,
        };
        return user;  
    }
};