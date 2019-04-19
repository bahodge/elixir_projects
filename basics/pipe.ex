defmodule Pipe do
    def piping(input) do
        input
        |> add(2)
        |> result
    end

    def add(num, incrementer) do
        num + incrementer
    end

    def result(sum) do
        IO.puts(sum)
    end
end