defmodule Fizzbuzz do
    

    # regular control flow in more OOP way


    def upto1(from, to) do
        from..to |> Enum.map(&fizzbuzz_1/1)
    end

    def fizzbuzz_1(digit) do
        cond do
            _fizzbuzz1(digit) ->
                "Fizzbuzz"
            _buzz1(digit) ->
                "Buzz"
            _fizz1(digit) ->
                "Fizz"
            true ->
                digit
        end
    end

    defp _fizzbuzz1(digit), do: rem(digit, 15) == 0
    defp _buzz1(digit), do: rem(digit, 5) == 0
    defp _fizz1(digit), do: rem(digit, 3) == 0


    # taking advantage of pattern matching

    def upto2(from, to) do
        from..to |> Enum.map(&fizzbuzz_2/1)
    end

    def fizzbuzz_2(n), do: _fizzword(n, rem(n, 3), rem(n, 5))

    defp _fizzword(_n, 0, 0 ), do: "Fizzbuzz"
    defp _fizzword(_n, _, 0 ), do: "buzz"
    defp _fizzword(_n, 0, _ ), do: "Fizz"
    defp _fizzword(n, _, _ ), do: n

    defp _fizzbuzz1(digit), do: rem(digit, 15) == 0
    defp _buzz1(digit), do: rem(digit, 5) == 0
    defp _fizz1(digit), do: rem(digit, 3) == 0


end