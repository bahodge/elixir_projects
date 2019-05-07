defmodule MiniMarkdown do
  def run do
    test_string() |> to_html
  end

  def to_html(text) do
    text
    |> h3
    |> h2
    |> h1
    |> p
    |> big
    |> small
    |> bold
    |> italics
    |> output_to_file
  end

  defp italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

  defp bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
  end

  defp h1(text) do
    Regex.replace(~r/(\r\n|\r|\n|^\s*)\#+([^#][^\r\n]+)/, text, "<h1>\\2</h1>")
  end

  defp h2(text) do
    Regex.replace(~r/(\r\n|\r|\n|^\s*)\#\# +([^#][^\n\r]+)/, text, "<h2>\\2</h2>")
  end

  defp h3(text) do
    Regex.replace(~r/(\r\n|\r|\n|^\s*)\#\#\# +([^#][^\n\r]+)/, text, "<h3>\\2</h3>")
  end

  defp p(text) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^#<][^\r\n]+)((\r\n|\r|\n)$)?/, text, "<p>\\2</p>")
  end

  defp big(text) do
    Regex.replace(~r/\+\+\+(.*)\+\+\+/, text, "<big>\\1</big>")
  end

  defp small(text) do
    Regex.replace(~r/\-\-\-(.*)\-\-\-/, text, "<small>\\1</small>")
  end

  defp test_string do
    """
    # Hello, h1

    ## Hello, h2

    ### Hello, h3

    I *so* loved eating that **AMAZING** burrito.
    what did you think of it?

    this text is +++big+++

    this text is ---small---

    """
  end

  def output_to_file(text) do
    File.write("./mini_markdown.html", text)
  end
end
