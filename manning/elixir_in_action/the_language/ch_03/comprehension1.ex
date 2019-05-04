defmodule Comprehension do
  def comp(list) do
    for x <- list do
      x + 1
    end
  end
end
