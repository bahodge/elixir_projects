defmodule Streams do
  def make_stream do
    range = 1..10_000
    Stream.map(range, fn x -> x * 2 end)
  end
end
