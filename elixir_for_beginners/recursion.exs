defmodule Recursion do
  def sum([], acc), do: acc

  def sum([head | tail], acc), do: sum(tail, acc + head)
end

IO.puts(Recursion.sum([1, 2, 3], 0))
