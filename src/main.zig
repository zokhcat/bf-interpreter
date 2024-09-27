const std = @import("std");

const MEMORY_SIZE: usize = 30000;

fn interpret(code: []const u8, allocator: std.mem.Allocator) !void {
    var memory = try allocator.alloc(u8, MEMORY_SIZE);
    defer allocator.free(memory);
    @memset(memory, 0);

    var data_pointer: usize = 0;

    for (code) |command| {
        switch (command) {
            '>' => {
                if (data_pointer < MEMORY_SIZE - 1) {
                    data_pointer += 1;
                }
            },
            '<' => {
                if (data_pointer > 0) {
                    data_pointer -= 1;
                }
            },
            '+' => memory[data_pointer] +%= 1,
            '-' => memory[data_pointer] -%= 1,
            else => {}, // Ignore other characters
        }
    }

    std.debug.print("Final memory state: ", .{});
    for (memory[0..10]) |value| {
        std.debug.print("{d} ", .{value});
    }
    std.debug.print("\n", .{});
}

pub fn main() !void {
    const input = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.";
    std.debug.print("{s}\n", .{input});

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    try interpret(input, allocator);
}
