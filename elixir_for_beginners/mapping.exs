defmodule Mapping do
  # def square([]), do: []
  # def square([head | tail]), do: [head * head | square(tail)]

  def square([], acc), do: acc
  def square([head | tail], acc), do: square(tail, acc ++ [head * head])
end

IO.inspect(Mapping.square([1, 2, 3, 4], []))
