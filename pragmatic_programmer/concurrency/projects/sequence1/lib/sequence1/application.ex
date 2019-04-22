defmodule Sequence1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    {:ok, _pid} =
      Sequence1.Supervisor.start_link(Application.get_env(:sequence1, :initial_number))

    # List all child processes to be supervised
    # children = [
    #   {Sequence1.Server, 0}

    #   # Starts a worker by calling: Sequence1.Worker.start_link(arg)
    #   # {Sequence1.Worker, arg}
    # ]

    # # See https://hexdocs.pm/elixir/Supervisor.html
    # # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Sequence1.Supervisor]
    # Supervisor.start_link(children, opts)
  end
end
