defmodule Comprehensions do
    
    def list_1 do
        [1,2,3]
    end

    def list_2 do
        [4,5]
    end

    def multiply(list) do
        for x <- list, do: x * x
    end

    def multiply(first_list, second_list) do
        for x <- first_list, y <- second_list, do: x * y 
    end

    def feeding_generators do
        min_max = [{1, 2}, {3, 6}, {10, 5}]
        for {bottom, top} <- min_max, n <- bottom..top, do: n
    end


end