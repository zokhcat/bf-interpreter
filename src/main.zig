const std = @import("std");

const MEMORY_SIZE: usize = 30000;

fn interpret(code: []const u8, allocator: std.mem.Allocator) !void {
    var memory = try allocator.alloc(u8, MEMORY_SIZE);
    defer allocator.free(memory);
    @memset(memory, 0);

    var instruction_pointer: usize = 0;
    var data_pointer: usize = 0;

    while (instruction_pointer < code.len) : (instruction_pointer += 1) {
        switch (code[instruction_pointer]) {
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
            '[' => {
                if (memory[data_pointer] == 0) {
                    var loop_depth: usize = 1;
                    while (loop_depth > 0) : (instruction_pointer += 1) {
                        instruction_pointer += 1;
                        if (instruction_pointer >= code.len) break;
                        switch (code[instruction_pointer]) {
                            '[' => loop_depth += 1,
                            ']' => loop_depth -= 1,
                            else => {},
                        }
                    }
                }
            },
            ']' => {
                if (memory[data_pointer] != 0) {
                    var loop_depth: usize = 1;
                    while (loop_depth > 0) : (instruction_pointer -= 1) {
                        if (instruction_pointer == 0) break;
                        instruction_pointer -= 1;
                        switch (code[instruction_pointer]) {
                            ']' => loop_depth += 1,
                            '[' => loop_depth -= 1,
                            else => {},
                        }
                    }
                }
            },
            else => {},
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
