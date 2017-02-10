# Sudoku

My first elixir project

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `sudoku` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:sudoku, "~> 0.1.0"}]
    end
    ```

  2. Ensure `sudoku` is started before your application:

    ```elixir
    def application do
      [applications: [:sudoku]]
    end
    ```

## Example

`./sudoku "9...7...." "2...9..53" ".6..124.." "84...1.9." "5.....8.." ".31..4..." "..37..68." ".9..5.741" "47......."`

## TODO

- add [documentation](http://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html)