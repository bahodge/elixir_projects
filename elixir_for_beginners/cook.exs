defmodule Cook do

  # # Public Function
  # def cook(meat, veg), do: _cook("Grill", meat) <> _cook("Boil", veg)

  # # Private function
  # defp _cook(cook, food) do
  #   "#{cook} #{food} "
  # end

  # def cook(food) when food === 0 do
  #   "Nothing cooking"
  # end
  # def cook(food) when is_integer(food), do: "Food is a number #{food}"
  # def cook(food) when is_atom(food), do: "Food is atomic #{food}"
  # def cook(food) when is_binary(food), do: cook("Boil", food)
  # def cook(type, food), do: "#{type} #{food}"

  # def cook(type \\ "Grill", food), do: "#{type} #{food}"

end

IO.puts String.upcase("ben") |> String.reverse

# IO.inspect(Cook.cook("chicken"))

# IO.inspect(Cook.cook(1))
# IO.inspect(Cook.cook(:queso))
# IO.inspect(Cook.cook("Queso"))

# IO.inspect Cook.boil("cookies")
# IO.inspect Cook.sausage
# IO.inspect Cook.cook("bacon", "pasta")
# IO.inspect Cook._cook "pasta", "bacon"
