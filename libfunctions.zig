// fn similar a função da "std":
//       std.mem.eql(tipo, []const, []const)
// retorna um booleano: true se for igual e false se diferente
pub fn eql(comptime T: type, a: []const T, b: []const T) bool {
    // if they aren't the same length, the can't be equal
    if (a.len != b.len) return false;

    for (a, b) |a_elem, b_elem| {
        if (a_elem != b_elem) return false;
    }
    return true;
}
