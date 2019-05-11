defmodule EspecTestsTest do
  use ExUnit.Case
  doctest EspecTests

  test "greets the world" do
    assert EspecTests.hello() == :world
  end
end
