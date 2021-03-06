defmodule Spawn4 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
        greet()
    end
  end
end

pid = spawn(Spawn4, :greet, [])
send(pid, {self(), "World"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

send(pid, {self(), "Ben"})

receive do
  {:ok, msg} ->
    IO.puts(msg)
after
  500 ->
    IO.puts("The Greeter went away")
end
