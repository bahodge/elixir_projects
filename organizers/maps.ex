defmodule Maps do
    
    def do_map() do
        %{my_map: "is_cool"}
    end

    def add_to_map do
        names = %{name1: "Ben", name2: "Steven"}
        Map.put(names, :name3, "Name3")
        |>IO.inspect
    end

end