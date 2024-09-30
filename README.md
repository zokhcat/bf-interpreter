# Brainfuck Interpreter in Zig

This project implements a Brainfuck interpreter using the Zig programming language. Brainfuck is an esoteric programming language known for its minimalism and simplicity, making it an interesting subject for interpreter implementation.

<br>

🚧 This project is currently a **WIP** 🚧

## Features

- Implements all standard Brainfuck commands: `>`, `<`, `+`, `-`, `.`, `,`, `[`, and `]`
- Includes a debug command `#` for easier debugging of Brainfuck programs
- Uses Zig's memory safety features and error handling
- Configurable memory size (default: 30,000 cells)

## Requirements

- Zig compiler (tested with version 0.10.0)

## Building the Project

1. Ensure you have Zig installed on your system. You can download it from the [official Zig website](https://ziglang.org/download/).

2. Clone this repository or download the `brainfuck.zig` file.

3. Open a terminal and navigate to the directory containing `brainfuck.zig`.

4. Compile the project using the following command:

   ```
   zig build-exe brainfuck.zig
   ```

5. This will create an executable named `brainfuck` (or `brainfuck.exe` on Windows).

## Running the Interpreter

1. After building the project, you can run the interpreter using:

   ```
   ./brainfuck
   ```

2. By default, it will run a "Hello World!" Brainfuck program. You can modify the `input` variable in the `main` function to run different Brainfuck programs.

## Brainfuck Commands

The interpreter supports the following Brainfuck commands:

- `>`: Move the data pointer to the right
- `<`: Move the data pointer to the left
- `+`: Increment the byte at the data pointer
- `-`: Decrement the byte at the data pointer
- `.`: Output the byte at the data pointer
- `,`: Accept one byte of input, storing its value in the byte at the data pointer
- `[`: If the byte at the data pointer is zero, jump to the matching `]`
- `]`: If the byte at the data pointer is nonzero, jump back to the matching `[`
- `#`: (Debug) Print the current instruction pointer and the first 10 memory cells

## Modifying the Interpreter

- You can change the `MEMORY_SIZE` constant to adjust the number of memory cells available to the Brainfuck programs.
- The debug command `#` can be useful for understanding the state of the memory during program execution. Feel free to modify its behavior as needed.

## Contributing

Contributions to improve the interpreter or extend its functionality are welcome. Please feel free to submit issues or pull requests.

## License

This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).

## Acknowledgements

This project was created as an educational exercise in implementing interpreters and working with the Zig programming language.
