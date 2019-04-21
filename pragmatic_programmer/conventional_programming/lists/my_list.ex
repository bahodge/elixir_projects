defmodule MyList do
    def len([]), do: 0
    def len([head | tail]), do: 1 + len(tail)
    # MyList.len([11,12,13,14,15]) ## 5
end