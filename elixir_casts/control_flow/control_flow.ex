defmodule Greeter do
  # if else
  def greet(lang) do
    if lang == "en", do: "Hello", else: "Bonjour"
  end

  # case
  def greet(lang) do
    case lang do
      "en" -> "Hello"
      "fr" -> "Bonjour"
      "es" -> "Hola"
      _ -> "Don't know that language"
    end
  end

  # cond
  def greet(lang) do
    cond do
      lang == "en" ->
        "Hello"

      lang == "fr" ->
        "Bonjour"

      lang == "es" ->
        "Hola"

      true ->
        "Don't know that language"
    end
  end
end
