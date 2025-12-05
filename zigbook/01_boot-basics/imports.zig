const std = @import("std");
const builtin = @import("builtin");
const root = @import("root");

pub const app_name = "Zig Book Example";
pub const app_version = "0.1.0";

pub fn main() !void {
    var stdout_buffer:[1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("app: {s} - version: {s}\n", .{root.app_name, root.app_version});

    try stdout.print("Optimize mode: {s}\n", .{@tagName(builtin.mode)});

    try stdout.print(
        "target: {s}-{s}-{s}\n",
        .{
            @tagName(builtin.target.cpu.arch),
            @tagName(builtin.target.os.tag),
            @tagName(builtin.target.abi),

        },
    );
    try stdout.flush();
}
