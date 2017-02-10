defmodule SudokuTest do
  use ExUnit.Case, async: true
  doctest Sudoku

  test "return an :ok tuple with the resolved grid" do
    actual = Sudoku.resolve([
      [9, nil, nil, nil, 7, nil, nil, nil, nil],
      [2, nil, nil, nil, 9, nil, nil, 5, 3],
      [nil, 6, nil, nil, 1, 2, 4, nil, nil],
      [8, 4, nil, nil, nil, 1, nil, 9, nil],
      [5, nil, nil, nil, nil, nil, 8, nil, nil],
      [nil, 3, 1, nil, nil, 4, nil, nil, nil],
      [nil, nil, 3, 7, nil, nil, 6, 8, nil],
      [nil, 9, nil, nil, 5, nil, 7, 4, 1],
      [4, 7, nil, nil, nil, nil, nil, nil, nil]
    ])
    expected = { :ok, [
      [9, 1, 4, 3, 7, 5, 2, 6, 8],
      [2, 8, 7, 4, 9, 6, 1, 5, 3],
      [3, 6, 5, 8, 1, 2, 4, 7, 9],
      [8, 4, 6, 5, 2, 1, 3, 9, 7],
      [5, 2, 9, 6, 3, 7, 8, 1, 4],
      [7, 3, 1, 9, 8, 4, 5, 2, 6],
      [1, 5, 3, 7, 4, 9, 6, 8, 2],
      [6, 9, 8, 2, 5, 3, 7, 4, 1],
      [4, 7, 2, 1, 6, 8, 9, 3, 5]
    ]}
    assert actual == expected
  end

  test "return an :error tuple when the grid can't be resolved" do
    actual = Sudoku.resolve([
      [4, nil, nil, nil, 7, nil, nil, nil, nil],
      [2, nil, nil, nil, 9, nil, nil, 5, 3],
      [nil, 6, nil, nil, 1, 2, 4, nil, nil],
      [8, 4, nil, nil, nil, 1, nil, 9, nil],
      [5, nil, nil, nil, nil, nil, 8, nil, nil],
      [nil, 3, 1, nil, nil, 4, nil, nil, nil],
      [nil, nil, 3, 7, nil, nil, 6, 8, nil],
      [nil, 9, nil, nil, 5, nil, 7, 4, 1],
      [4, 7, nil, nil, nil, nil, nil, nil, nil]
    ])
    expected = { :error, "Can't resolve the grid" }
    assert actual == expected
  end
end
