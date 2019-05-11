defmodule Looper do
  def loop_until(n) do
    Enum.each(0..n, fn num -> IO.puts(num) end)
  end

  def loop_through(x, y) do
    Enum.each(x..y, fn num -> IO.puts(num) end)
  end


  end

end
