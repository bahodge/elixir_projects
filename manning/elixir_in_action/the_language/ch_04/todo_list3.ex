defmodule TodoList do
  def entries(todo_list, date) do
    HashDict.get(todo_list, date, [])
  end
end