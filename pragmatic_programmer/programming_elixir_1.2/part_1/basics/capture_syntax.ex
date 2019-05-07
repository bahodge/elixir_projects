defmodule CaptureSyntax do
  def starting_list do
    []
  end

  def add_num_to_list(list, num) do
    [num | list]
  end

  def count_items_in_list(list) do
    Enum.count(list)
  end
end
