defmodule CliTest do
  use ExUnit.Case

  doctest Issues

  import Issues.CLI,
    only: [parse_args: 1, convert_to_list_of_maps: 1]

  def fake_created_at_list(values) do
    data =
      for value <- values,
          do: [{"created_at", value}, {"other_data", "xxx"}]

    convert_to_list_of_maps(data)
  end

  test ":help return by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything!"]) == :help
    assert parse_args(["--help", "anything!"]) == :help
  end

  test "three values returned if 3 given" do
    assert parse_args(["user_1", "project_1", "10"]) == {"user_1", "project_1", 10}
  end

  test "get default options value if only 2 given" do
    assert parse_args(["user_1", "project_1"]) == {"user_1", "project_1", 4}
  end
end
