defmodule TcpPracticeTest do
  use ExUnit.Case
  doctest TcpPractice

  test "greets the world" do
    assert TcpPractice.hello() == :world
  end
end
