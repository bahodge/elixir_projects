defmodule Business.Operation do
  defstruct address: nil, owner: nil, result: 0

  def add_numbers(a, b) when is_number(a) and is_number(b), do: {:ok, a + b}
  def add_numbers({a, b}), do: {:ok, a + b}

  def subtract_numbers(a, b) when is_number(a) and is_number(b), do: {:ok, a - b}
  def subtract_numbers({a, b}), do: {:ok, a - b}

  def do_work(arg_1, arg_2) do
    {_, sum_arg_1} = add_numbers(arg_1)
    {_, sum_arg_2} = add_numbers(arg_2)
    subtract_numbers({sum_arg_1, sum_arg_2})
  end
end
