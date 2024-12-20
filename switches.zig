const std = @import("std");
const stdout = std.io.getStdOut().writer();
const Role = enum{
    SE, DPE, DE, DA, PM, PO, KS
};

pub fn main() !void {
    // var area:[]const u8 = undefined;
    // const role = Role.SE;

    // Uma forma
    // switch(role){
    //     .PM, .SE, .DPE, .PO =>{
    //         area = "Platform";
    //     },
    //     .DE, .DA =>{
    //         area = "Data & Analytics";
    //     },
    //     // .KS => {
    //     //     area = "Sales";
    //     // },
    //     // ou, tem que cobrir todas as opções
    //     else => {
    //         area = "Sales";
    //     },
    // }

    // outra forma
    // atribuindo valores 
    // chamando panic caso a regra nao seja suportada
    // area = switch(role){
    //     .PM, .SE, .DPE, .PO => "Platform",
    //     .DE, .DA => "Data & Analytics",
    //     // .KS => "Sales",
    //     // ou, tem que cobrir todas as opções
    //     else => {
    //         @panic("Role não suportada\n");
    //     },
    // };
    // try stdout.print("{s}\n", .{area});

    // switch com intervalos:
    // const level:u8 = 4;
    // const category = switch(level){
    //     0...25 => "beginner",
    //     26...75 => "intermediary",
    //     76...100 => "professional",
    //     else => { @panic("Not supported level!\n");},
    // };
    // try stdout.print("{s}\n", .{category});


    // Declarações switch rotuladas, como blocos (branches)
    // Nao funcionou, está dando erro na vs 0.13
    // parece que só a partir da vs 0.14
    // pode aplicar rótulos sobre instruções switch
    xsw: switch (@as(u8,1)){
        1 => {
            try stdout.print("First branch\n", .{});
            continue :xsw 2;
        },
        2 => continue :xsw 3,
        3 => return,
        
        else => {@panic("Not supported level!\n");},
    }

    

}