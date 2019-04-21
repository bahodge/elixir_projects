defmodule Guard do
    def count(n) when is_number(n) do
        u =  n + 1
        IO.puts(u)
    end

    def count(n) when is_list(n) do
        Enum.map(n, fn x -> IO.puts x * 2 end)
    end


end