defmodule Issues.CLI do
  @default_count 4

  @moduledoc """
      Hanlde cli parsing

  """

  def run(argv) do
    parse_args(argv)
    |> process
  end

  @doc """
      `argv` can be -h or --help, which returns :help

      Otherwise it is a github user name, project name, and (optional) number of entries

      Return a tuble of `{user, project, count}`, or `:help` if help was given.
  """


  def process(:help) do
    IO.puts("""
      usage: Issues <user> <project> [ count | #{@default_count}]
    """)

    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response
    |> convert_to_list_of_maps
  end

  def parse_args(argv) do
    parse =
      OptionParser.parse(argv,
        switches: [help: :boolean],
        aliases: [h: :help]
      )

    case parse do
      {[help: true], _, _} -> :help
      {_, [user, project, count], _} -> {user, project, count}
      {_, [user, project], _} -> {user, project, @default_count}
      _ -> :help
    end
  end


  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    {_, message} = List.keyfind(error, "message", 0)
    IO.puts "error fetching from github: #{message}"
    System.halt(2)
    end

    def convert_to_list_of_maps(list) do
      list
      |> Enum.map(&Enum.into(&1, Map.new))
    end


end
