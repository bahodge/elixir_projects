defmodule EnumTools do
  def call_map do
    Enum.map([1, 2, 3, 4, 5], fn x -> x * x end)
  end

  def call_reduce do
    Enum.reduce([1, 2, 3, 4, 5], 0, fn x, acc -> x + acc end)
  end
end

IO.inspect(EnumTools.call_map())
IO.inspect(EnumTools.call_reduce())
