defmodule Comprehension do
  def comp_1(list) do
    for x <- list do
      x + 1
    end
  end

  def comp_2(list_1, list_2) do
    for x <- list_1, y <- list_2 do
      {x, y}
    end
  end
end
