defmodule DatabaseServerTest do
  use ExUnit.Case
  doctest DatabaseServer

  test "greets the world" do
    assert DatabaseServer.hello() == :world
  end
end
