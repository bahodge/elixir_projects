defmodule Fib do
  def time(func, arg) do
    t0 = Time.utc_now()
    func.(arg)
    Time.diff(Time.utc_now(), t0, :millisecond)
  end

  def compare(n \\ 40) do
    IO.puts("Naive: #{time(&naive/1, n)}")
    IO.puts("Tail Recursion: #{time(&tail_recursion/1, n)}")
  end

  # O(n^2)
  def naive(1), do: 1
  def naive(2), do: 1

  def naive(n) do
    naive(n - 2) + naive(n - 1)
  end

  # O(n)
  def tail_recursion(n), do: tail_recursion(n, 0, 1)
  def tail_recursion(1, _acc_1, acc_2), do: acc_2

  def tail_recursion(n, acc_1, acc_2) do
    tail_recursion(n - 1, acc_2, acc_1 + acc_2)
  end
end
