defmodule ReadFileAsStream do
  def longest_word do
    File.open!("./streams.ex")
    |> IO.stream(:line)
    |> Enum.max_by(&String.length/1)
  end
end
