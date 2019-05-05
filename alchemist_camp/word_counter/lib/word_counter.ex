defmodule WordCounter do
  def start(parsed, file, invalid) do
    if invalid != [] or file == "h" do
      show_help()
    else
      read_file(parsed, file)
    end
  end

  defp show_help do
    IO.puts("""
    Usage: [filename] -[flags]
    Flags
    -l     displays line count
    -c     displays character count
    -w     displays word count (default)
    Multiple flags may be used. Example usage to display line and character count:
    somefile.txt -lc
    """)
  end

  defp read_file(parsed, file) do
    flags =
      case Enum.count(parsed) do
        0 -> [:words]
        _ -> Enum.map(parsed, &elem(&1, 0))
      end

    body = File.read!(file)

    print_result(flags, body)
  end

  defp parse_lines(body) do
    String.split(body, ~r{(\r\n|\n|\r|)})
  end

  defp parse_words(body) do
    String.split(body, ~r{(\\n|[^\w']+)})
    |> Enum.filter(fn x -> x != "" end)
  end

  defp parse_chars(body) do
    String.split(body, "")
    |> Enum.filter(fn x -> x != "" end)
  end

  defp print_result(flags, body) do
    Enum.each(flags, fn flag ->
      case flag do
        :lines -> IO.puts("Lines: #{Enum.count(parse_lines(body))}")
        :words -> IO.puts("Words: #{Enum.count(parse_words(body))}")
        :chars -> IO.puts("Chars: #{Enum.count(parse_chars(body))}")
        _ -> nil
      end
    end)
  end
end
