defmodule AlchemyMarkdown do
  def to_html(markdown) do
    Earmark.as_html!(
      markdown || "",
      %Earmark.Options{smartypants: false}
    )
    |> big
    |> small
    |> hr
  end

  def big(text) do
    Regex.replace(~r/\+\+(.*)\+\+/, text, "<big>\\1</big>")
  end

  def small(text) do
    Regex.replace(~r/\-\-(.*)\-\-/, text, "<small>\\1</small>")
  end

  def hr(text) do
    Regex.replace(~r/^([-*])\s*\1\s*\1/m, text, "<hr />")
  end

  def run_anon_func do
#    raise "oops"
    Enum.each([1,2,3], fn x -> IO.puts x end)
  end

  def test_string do
    """
    # Hello, h1

    ## Hello, h2

    ### Hello, h3

    I *so* loved eating that **AMAZING** burrito.
    what did you think of it?

    this text is ++big++

    this text is --small--
    """
  end
end
