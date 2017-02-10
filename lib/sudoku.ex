defmodule Sudoku do
  #./sudoku "9...7...." "2...9..53" ".6..124.." "84...1.9." "5.....8.." ".31..4..." "..37..68." ".9..5.741" "47......."
  #
  # 9 . . . 7 . . . .
  # 2 . . . 9 . . 5 3
  # . 6 . . 1 2 4 . .
  # 8 4 . . . 1 . 9 .
  # 5 . . . . . 8 . .
  # . 3 1 . . 4 . . .
  # . . 3 7 . . 6 8 .
  # . 9 . . 5 . 7 4 1
  # 4 7 . . . . . . .
  #

  import Enum, only: [each: 2, join: 2, to_list: 1]

  def main(args) do
    IO.puts("Elixir sudoku resolver")
    
    case Parse.args(args) |> resolve do
      { :ok, fulfilled_grid } -> _print(fulfilled_grid)
      { :error, reason } -> IO.puts(reason)
    end

    IO.puts("Made with >3 by TinOo")
  end

  def resolve(grid) do
    if Grid.is_fulfilled(grid) do
      { :ok, grid }
    else
      { row, col } = Grid.find_empty(grid)
      Backtrack.run(to_list(1..9), &(_search(grid, row, col, &1)))
    end
  end

  defp _print(grid) do
    each(grid, fn xs -> join(xs, ".") |> IO.puts end)
  end

  defp _search(grid, row, col, i) do
    if Grid.is_safe(grid, row, col, i) do
      case Grid.update_in(grid, row, col, i) |> resolve do
        { :ok, fulfilled_grid } -> { :halt, fulfilled_grid }
        { :error, _ } -> { :cont }
      end
    else
      { :cont }
    end
  end

end
