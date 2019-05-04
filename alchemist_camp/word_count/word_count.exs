filepath =
  IO.gets("Filepath\n")
  |> String.trim()

body = File.read!(filepath)
IO.inspect(body)
