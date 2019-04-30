defmodule TailRecursive do
  def factorial(n), do: _factorial(n, 1)
  defp _factorial(0, accumulator), do: accumulator
  defp _factorial(n, accumulator), do: _factorial(n - 1, accumulator * n)
end
