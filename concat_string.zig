const std = @import("std");

pub fn main() !void {
    // const url = "https://github.com/{}/reponame";
    const user = "Himujjal";

    // formas:
    // 1ª Array concatenation operator "++" -> ok!
    // const final_url = "https://github.com/" ++ user ++ "/reponame";

    // 2ª com std.fmt - comptime know -> ok!
    // const final_url = comptime std.fmt.comptimePrint("https://github.com/{s}/reponame", .{user});

    // 3ª - runtime with allocation -> falta definir alloc ??
    // const final_url = try std.fmt.allocPrint(alloc, "https://github.com/{s}/reponame", .{user});
    // defer alloc.free(final_url);

    // 4ª runtime, no allocation -> ok!
    // var buffer = [_]u8{undefined}**100;
    // const final_url = try std.fmt.bufPrint(&buffer,"https://github.com/{s}/reponame",  .{user});

    // 5ª runtime - using ArrayList -> falta definir gpa ??
    var string = std.ArrayList(u8).init(gpa);
    defer string.deinit();
    try string.appendSlice("https://github.com/");
    try string.appendSlice(user);
    try string.appendSlice("/reponame");
    const final_url = string.items;

    std.debug.print("final_url: {s}\n", .{final_url});
}
