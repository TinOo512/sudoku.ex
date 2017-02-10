defmodule Parse do

  import Enum, only: [map: 2]
  import String, only: [graphemes: 1, to_integer: 1]

  defp _split(string) do
    graphemes(string)
  end

  defp _coerce(string) when string == "." do
    nil
  end

  defp _coerce(string) do
    to_integer(string)
  end

  def args(args) do
    {_, args, _} = OptionParser.parse(args)
    map(args, fn x -> _split(x) |> map(&_coerce/1) end)
  end

end
