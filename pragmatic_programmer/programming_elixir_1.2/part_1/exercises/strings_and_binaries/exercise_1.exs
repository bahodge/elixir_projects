defmodule Exercise1 do
  def number([?- | tail]), do: _number_digits(tail, 0) * -1
  def number([?+ | tail]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value

  defp _number_digits([digit | tail], value) when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end

  defp _number_digits([non_digit | tail], value) do
    raise "Invalid digit, '#{non_digit}'"
  end

  def word([?c | tail]), do: _word_letters(tail, 0)
  def word(str), do: _word_letters(str, 0)

  defp _word_letters([], value), do: value

  defp _word_letters([letter | tail], value) when letter not in '0123456789' do
    _word_letters(tail, letter)
  end

  def result(str) do
    string = List.to_string(str)
    {true, string}
  end
end
