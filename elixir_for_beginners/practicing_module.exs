defmodule Cooking do

  def cook_meal(protine, veg \\ "salad") do
    _gather_ingredient(protine)
    _gather_ingredient(veg)

    _cook_ingredient("Grill", protine)
    _cook_ingredient("Prepare", veg)

    _serve_meal(protine, veg)
  end

  defp _gather_ingredient(ingredient) do
    IO.puts "Gathered #{ingredient}"
  end

  defp _cook_ingredient(style, ingredient), do: IO.puts "#{style}ing #{ingredient}"

  defp _serve_meal(meat, veg) do
    IO.puts "Here is an amazing meal: #{meat} and #{veg}"
  end
end
