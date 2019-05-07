defmodule Caboose do
  @default_lines 10

  def start(parsed, filename, invalid) do
    help_flag = Enum.member?(parsed, {:help, true})

    if Enum.count(filename) != 1 or invalid != [] or help_flag do
      IO.puts("Help")
      show_help()
    else
      flags = Enum.into(parsed, %{})
      read_file(filename, flags)
    end
  end

  defp show_help do
    IO.puts("""
        Usage: caboose [filename] -[flags] [flag args]

        Flags:
          --help, -h        Displays this message
          --lines [number]  Displays the last n lines of file
    """)
  end

  defp read_file(filename, flags) do
    body = File.read!(filename)
    lines = String.split(body, ~r{(\r\n|\r|\n)})

    num_displayed = if flags[:lines], do: flags[:lines], else: @default_lines

    lines
    |> Enum.take(num_displayed)
    |> Enum.join("\n")
    |> IO.puts()
  end
end
