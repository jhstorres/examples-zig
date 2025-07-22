const std = @import("std");

const print = std.debug.print;

pub fn main() void {
    {
        print("Hello, World!\n", .{});
        const array = [_]i32{10,20,30,40};
        var ptr:[*]const i32 = &array;
        print("ptr[0] == 10 ({})\n", .{ptr[0]==10});
        print("ptr == {*}\n", .{ptr});
        ptr += 1; // Move the pointer to the next element
        print("ptr[0] == 30 ({})\n", .{ptr[0]==30});
        print("ptr == {*}\n", .{ptr});

        print("ptr = {s}\n", .{&ptr});
        
        print("ptr[1..] == {}\n", .{ptr[1]});

        print("ptr[2..] == ptr + 2 {}\n", .{ptr[1..]==ptr + 1});
        print("ptr[1..] == {}\n", .{ptr[1]});
        print("&ptr[1] == {}\n", .{&ptr[0]});
    }
    {
       //"comptime pointers" 
        //comptime 
        {
            var x: i32 = 1;
            const ptr = &x;
            ptr.* += 1;
            x += 1;
            print("ptr.* == 3 -> {}\n", .{ptr.* == 3});
        }
    }    
    {
        //"0-terminated slicing"
        var array = [_]u8{ 3, 2, 1, 0, 3, 2, 1, 0 };
        var runtime_length: usize = 3;  //se o slice for terminado em 0 e o comprimento
                                        // 2 gera um erro pois teria apenas 1 elemento
        
        _ = &runtime_length;
        const slice = array[0..runtime_length :0]; //colocando uma terminacao em 0

        print("@TypeOf(slice) == [:0]u8 -> {}\n", .{@TypeOf(slice)});
        print("slice.len == {} -> {}\n", .{slice.len, slice.len == 2});

    }


}