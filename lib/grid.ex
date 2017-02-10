defmodule Grid do

  import Enum, only: [find: 2, any?: 2, map: 2, fetch!: 2, count: 2]
 
  @cells for row <- 0..8, col <-0..8, do: { row, col }

  def get_in(grid, row, col) do
    get_in(grid, [Access.at(row), Access.at(col)])
  end

  def update_in(grid, row, col, num) do
    update_in(grid, [Access.at(row), Access.at(col)], fn _ -> num end)
  end

  def has_in(grid, row, col) do
    not_nil = fn x -> !is_nil(x) end
    get_in(grid, row, col) |> not_nil.()
  end

  def find_empty(grid) do
    find(@cells, fn { row, col } -> !has_in(grid, row, col) end)
  end

  def count_empty(grid) do
    count(@cells, fn { row, col } -> !has_in(grid, row, col) end)
  end

  def is_fulfilled(grid) do
    !any?(@cells, fn { row, col } -> !has_in(grid, row, col) end)
  end

  def is_safe(grid, row, col, num) do
    !_contains(_get_row(grid, row), num)
      && !_contains(_get_column(grid, col), num)
      && !_contains(_get_square(grid, row, col), num)
  end

  defp _contains(xs, int) do
    any?(xs, fn x -> x === int end)
  end

  defp _get_row(grid, int) do
    fetch!(grid, int)
  end

  defp _get_column(grid, int) do
    map(grid, &fetch!(&1, int))
  end

  defp _get_square(grid, row, col) do
    row_start = row - rem(row, 3)
    row_end = row_start + 2
    col_start = col - rem(col, 3)
    col_end = col_start + 2

    cells = for row <- row_start..row_end, col <- col_start..col_end, do: { row, col }
    map(cells, fn { row, col } -> get_in(grid, row, col) end)
  end

end
