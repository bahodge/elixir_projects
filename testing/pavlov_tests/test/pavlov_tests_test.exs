defmodule PavlovTestsTest do
  use ExUnit.Case
  doctest PavlovTests

  test "greets the world" do
    assert PavlovTests.hello() == :world
  end
end
