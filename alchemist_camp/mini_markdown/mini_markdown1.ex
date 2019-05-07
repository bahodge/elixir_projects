defmodule MiniMarkdown do
  def run do
    test_string() |> to_html
  end

  def to_html(text) do
    text
    |> p
    |> bold
    |> italics
    |> output_to_file
  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
  end

  def p(text) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)$)?/, text, "<p>\\2</p>")
  end

  defp test_string do
    """
    I *so* loved eating that **AMAZING** burrito.
    what did you think of it?

    asdf
    """
  end

  def output_to_file(text) do
    File.write("./mini_markdown.html", text)
  end
end
