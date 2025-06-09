// You can edit this code!
// Click into the editor and start typing.
const std = @import("std");


pub fn main() void {
    const one_plus_one:i32 = 1 + 1;
    std.debug.print("1 + 1 = {}", .{one_plus_one});
    
    var x:i8 = 127;
    x = 12;
    std.debug.print("x = {}, type of x = {}\n",.{x, @TypeOf(x)});
    
    std.debug.print("Type of hello = {}\n",.{@TypeOf("hello")});
    
    const pattern = [_]u8{1,2,3} ** 3;
    std.debug.print("pattern = {any}\n", .{pattern});
    
    std.debug.print("type of 1: {}\n",.{@TypeOf(1)});
    
    const mat4x4 = [4][4]u8{
        [_]u8{1,0,0,0},
        [_]u8{0,1,0,0},
        [_]u8{0,0,1,0},
        [_]u8{0,0,0,1},
    };
    std.debug.print("mat4x4 = {any}\n", .{mat4x4});
    
    std.debug.print("fn divide(8,3) = {}:{} .... {}\n", .{divide(8,3),@TypeOf(divide(5, 3)), @TypeOf(5.0/3.0)});
    
    const big = @as(f64, 0b1<<3);
    std.debug.print("big = {} - type of big = {}\n",.{big, @TypeOf(big)});
   
    const int_ex:i16 = @as(i16, 127.0);//@intFromFloat(divide(5,3)); //explicit cast
    std.debug.print("int_ex = {} - type of int_ex = {}\n",.{int_ex, @TypeOf(int_ex)});

    //bool example
    {
        const a = 5;
        const b = 3;
        const result = if(a != b) 47 else 3089;
        std.debug.print("result = {} - type of result = {}\n", .{result, @TypeOf(result)});

        if(a!=b){
            std.debug.print("a != b\n", .{});
        } else {
            std.debug.print("a == b\n", .{});
        }
    }

}


fn divide(a:f32, b:f32) comptime_int {
    // @divTrunc, @divFloor, or @divExact
    const value = a / b;
    return @round(value);  //@floor, @ceil e @trunc
    //return (a/b);
    //return @divFloor(a, b);
}