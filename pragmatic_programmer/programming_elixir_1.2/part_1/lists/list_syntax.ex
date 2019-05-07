defmodule ListSyntax do
  def my_list do
    [head | tail] = [1, 2, 3, 2, 3, 4]

    IO.inspect(head)
    IO.inspect(tail)
  end
end
