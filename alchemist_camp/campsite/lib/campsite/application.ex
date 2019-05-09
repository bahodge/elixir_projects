defmodule Campsite.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    start_cowboy()
    children = []
    opts = [strategy: :one_for_one, name: Campsite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp start_cowboy() do
    route1 = {"/", Campsite.Web.PageHandler, :base}
    route2 = {"/2", Campsite.Web.PageHandler, :too}
    route3 = {"/contact", Campsite.Web.PageHandler, :contact}
    route4 = {"/upupdowndownleftrightleftrightba", Campsite.Web.PageHandler, :secret}
    others = {:_, Campsite.Web.PageHandler, :others}
    dispatch = :cowboy_router.compile([{:_, [route1, route2, route3, route4, others]}])
    opts = [port: 4000]
    env = [dispatch: dispatch]

    case :cowboy.start_http(:http, 10, opts, env: env) do
      {:ok, _pid} -> IO.puts("Cowboy is now running. go to http://localhost:4000")
      _ -> IO.puts("There was a problem starting cowboy")
    end
  end
end
