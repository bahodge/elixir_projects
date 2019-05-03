defmodule TailCall do
  # def ten_times(0), do: 0

  # def ten_times(n) do
  #   10 + ten_times(n - 1)
  # end

  def ten_times(n), do: ten_times(n, 0)
  def ten_times(0, acc), do: acc

  def ten_times(n, acc) do
    ten_times(n - 1, acc + 10)
  end
end

IO.puts(TailCall.ten_times(3))
