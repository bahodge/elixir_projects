defimpl Enumerable, for: Bitmap do
  import :math, only: [log: 1]

  def count(%Bitmap{value: value}) do
    {:ok, trunc(log(abs(value)) / log(2)) + 1}
  end
end

fifty = %Bitmap{value: 50}
IO.puts(Enum.count(fifty))
