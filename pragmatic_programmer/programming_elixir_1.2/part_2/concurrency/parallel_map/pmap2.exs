defmodule Parallel2 do
  def pmap2(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn elem ->
      spawn_link(fn -> send(me, {self, fun.(elem)}) end)
    end)
    |> Enum.map(fn pid ->
      receive do
        # ensures the order of the process execution is right
        {^pid, result} ->
          :timer.sleep(10)
          result
      end
    end)
  end
end
