defmodule TodoList do
  def add_entry(todo_list, date, title) do
    HashDict.update(todo_list, date, [title], fn titles -> [title | titles] end)
  end
end
