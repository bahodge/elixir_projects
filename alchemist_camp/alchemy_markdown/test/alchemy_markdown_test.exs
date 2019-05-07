defmodule AlchemyMarkdownTest do
  use ExUnit.Case
  doctest AlchemyMarkdown

  test "italicises" do
    str = "somthing *important*"
    assert AlchemyMarkdown.to_html(str) =~ "<em>important</em>"
  end

  test "expands big tags" do
    str = "som ++big++ words"
    assert AlchemyMarkdown.to_html(str) =~ "<big>big</big> words"
  end

  test "expands small tags" do
    str = "som --small-- words"
    assert AlchemyMarkdown.to_html(str) =~ "<small>small</small> words"
  end

  test "expands hr tags" do
    str1 = "Stuff over the line\n---"
    str2 = "Stuff over the line\n***"
    str3 = "Stuff over the line\n- - -"
    str4 = "Stuff over the line\n* * *"

    Enum.map([str1, str2, str3, str4], fn str ->
      assert AlchemyMarkdown.hr(str) == "Stuff over the line\n<hr />"
    end)
  end
end
