defmodule Streams do
  def double_numbers(list) do
    s = Stream.map(list, fn x -> x * x end)
  end
end
