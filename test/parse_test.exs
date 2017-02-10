defmodule ParseTest do
  use ExUnit.Case, async: true
  doctest Parse

  test "parse cli arguments" do
    actual = Parse.args([
      "9...7....",
      "2...9..53",
      ".6..124..",
      "84...1.9.",
      "5.....8..",
      ".31..4...",
      "..37..68.",
      ".9..5.741",
      "47......."
    ])
    expected = [
      [9, nil, nil, nil, 7, nil, nil, nil, nil],
      [2, nil, nil, nil, 9, nil, nil, 5, 3],
      [nil, 6, nil, nil, 1, 2, 4, nil, nil],
      [8, 4, nil, nil, nil, 1, nil, 9, nil],
      [5, nil, nil, nil, nil, nil, 8, nil, nil],
      [nil, 3, 1, nil, nil, 4, nil, nil, nil],
      [nil, nil, 3, 7, nil, nil, 6, 8, nil],
      [nil, 9, nil, nil, 5, nil, 7, 4, 1],
      [4, 7, nil, nil, nil, nil, nil, nil, nil]
    ]
    assert actual == expected
  end

end
