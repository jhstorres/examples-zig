const OpenError = error{
    AccessDenied,
    NotFound,
};

//
pub fn main() !void {
    return OpenError.AccessDenied;
}
