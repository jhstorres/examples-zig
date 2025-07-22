// You can edit this code!
// Click into the editor and start typing.
const std = @import("std");
const builtin = @import("builtin");
const c = @cImport({
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("stdio.h");
});

pub fn main() void {
    std.debug.print("Hello, {s}! (using Zig version: {})\n", 
        .{ "with Zig", builtin.zig_version });
    
    _ = c.printf("Hello with C!\n");
}
