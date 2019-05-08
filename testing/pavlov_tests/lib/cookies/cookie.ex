defmodule Cookies.Cookie do
  defstruct [:type, :rating]

  def new(type, rating) do
    %Cookies.Cookie{type: type, rating: rating}
  end

  def rate(cookie \\ nil) do
    case cookie do
      nil -> "You didn't rate a cookie"
      _ -> "You rated cookie as #{cookie.rating}"
    end
  end
end
