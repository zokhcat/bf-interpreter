const std = @import("std");

pub fn main() !void {
    const input = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.";
    std.debug.print("{s}\n", .{input});
}
