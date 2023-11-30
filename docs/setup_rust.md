# Setup (Rust) AoC 2023

> @ChrisBiscardi: [How to set up Rust for Advent of Code](https://www.youtube.com/watch?v=fEQv-cqzbPg)

## Software installation

> HOST OS: Pop!_OS 22.04


- Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```

- VSCodium

```bash
codium --install-extension rust-lang.rust-analyzer
    # bit invasive...
```

## Project structure setup

```bash
mkdir ~/advent-of-code-2023 && cd $_ 

cargo new --vcs none day-01 && cd $_

cargo run

mkdir src/bin

mv src/main.rs src/bin/part1.rs
cp src/bin/part1.rs src/bin/part2.rs

sed -i 's/Hello, world!/part1!/' src/bin/part1.rs
sed -i 's/Hello, world!/part2!/' src/bin/part2.rs

cargo run --bin part1
cargo run --bin part2
```

## Running tests

- Rust file

```sh
touch src/bin/input1.txt
nvim src/bin/part1.rs
```

```rs
fn main() {
    let input = include_str!("./input1.txt");
    let output = part1(input);
    dbg!(output);
}

fn part1(input: &str) -> String {
    // "todo!()".to_string()
    "3000".to_string()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = part1("
1000
2000
        ");
        assert_eq!(result, "3000".to_string());
    }
}
```

<details>
<summary>Notes</summary>


- `#[foo(bar)]`
  - In Rust, #[cfg(test)] is an attribute used to conditionally compile code based on the presence of the --cfg flag during compilation. Specifically, #[cfg(test)] is used to indicate that the following module or block of code should only be compiled when running tests.
  - #[cfg(test)] is applied to the mod tests { ... } block. This means that the entire module (or the block enclosed in curly braces) will only be compiled when running tests.
  - mod tests { ... } is a module containing test functions. Test functions are marked with the #[test] attribute. In this case, there is a single test function called it_works that checks whether the sum of 2 and 2 is equal to 4 using the assert_eq! macro.
  - When you run tests using cargo test, Rust will include the code within the #[cfg(test)] block, and any associated test functions marked with #[test] will be executed. This allows developers to separate test code from the main codebase and ensures that the test code is only compiled and run when needed.

</details>


- Commands


```bash
cargo test
```


