defmodule Parallel1 do
  def pmap1(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn elem ->
      spawn_link(fn -> send(me, {self, fun.(elem)}) end)
    end)
    |> Enum.map(fn _pid ->
      receive do
        # executes map in the processes order they are received
        {_pid, result} ->
          :timer.sleep(10)
          result
      end
    end)
  end
end
