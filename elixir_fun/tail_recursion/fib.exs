defmodule Fib do
  def bad_fib(0), do: 0
  def bad_fib(1), do: 1
  def bad_fib(n), do: bad_fib(n - 1) + bad_fib(n - 2)

  def good_fib(n), do: good_fib(n, 0, 1)
  def good_fib(1, _acc_1, acc_2), do: acc_2

  def good_fib(n, acc_1, acc_2) do
    good_fib(n - 1, acc_2, acc_1 + acc_2)
  end
end

n = 50
good_task = Fib.good_fib(n)
IO.inspect("Good #{good_task}")
bad_task = Fib.bad_fib(n)
IO.inspect("Bad #{bad_task}")
