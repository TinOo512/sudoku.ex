defmodule Backtrack do
  
  def run([head | tail], fun) do
    case fun.(head) do
      { :cont } -> run(tail, fun)
      { :halt, result } -> { :ok, result }
    end
  end

  def run([], _) do
    { :error, "Can't resolve the grid" }
  end

end
