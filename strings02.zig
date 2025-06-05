const std = @import("std");

pub fn main() !void {
    const bytes = "Hello";
    std.debug.print("bytes: {s} - type: {}\n", .{bytes, @TypeOf(bytes)});
    std.debug.print("bytes: {d}\n", .{bytes.len});
    std.debug.print("{c}\n", .{bytes[2]});
    std.debug.print("{d}\n", .{bytes[5]}); // This will print "0" wish the array is a string terminated in "0"
    std.debug.print("{}\n", .{'e' == '\x65'});


    const slice = "Hello, world!"[7..];
    // The slice starts at index 7 and goes to the end of the string
    // This means it will contain "world!"
    // The slice is a view into the original string, not a copy
    std.debug.print("slice: {s} - type: {}\n", .{slice, @TypeOf(slice)});
    std.debug.print("slice: {d}\n", .{slice.len});
    std.debug.print("{c}\n", .{slice[0]});
    std.debug.print("{d}\n", .{slice[6]}); // This will print "0" wish the array is a string terminated in "0"

    std.debug.print("Dec(128175) to Hex: {x}\n", .{128175}); // This will print the Unicode character U+1F4AF (HEAVY CHECK MARK) 
    std.debug.print("Hex to Char(unicode) (u+1f4af): {u}\n", .{0x1f4af}); // This will print the Unicode character U+1F4AF (HEAVY CHECK MARK)
    std.debug.print("Dec to Char(unicode) (128175): {u}\n", .{128175}); // This will print the Unicode character U+1F4AF (HEAVY CHECK MARK)
    std.debug.print("{}\n", .{@TypeOf("\xf0\x9f\x92\xaf")}); // This will print the Unicode character U+1F4AF (HEAVY CHECK MARK)
    std.debug.print("0x{x}\n",.{"💯"});
    std.debug.print("Hex to Char(unicode) (u+1f4a9): {u}\n", .{'\u{1f4a9}'}); // This will print the decimal value of the Unicode character U+1F4A9 (PILE OF POO)
    std.debug.print("Char to Dec (💩): {d}\n", .{'💩'}); // This will print the decimal value of the Unicode character U+1F4A9 (PILE OF POO)
    std.debug.print("Char to Oct (💩): {o}\n", .{'💩'}); // This will print the Octal value of the Unicode character U+1F4A9 (PILE OF POO)
    std.debug.print("Char to Bin (💩): {b}\n", .{'💩'}); // This will print the Binary value of the Unicode character U+1F4A9 (PILE OF POO) 
    std.debug.print("Char to Hex (💩): {x}\n", .{'💩'}); // This will print the Hexadecimal value of the Unicode character U+1F4A9 (PILE OF POO)

    const my_str = "💯";
    std.debug.print("String: {s} - type: {}\n", .{my_str, @TypeOf(my_str)});
    std.debug.print("String length: {}\n", .{my_str.len});
}