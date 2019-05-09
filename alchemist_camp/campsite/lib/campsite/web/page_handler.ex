defmodule Campsite.Web.PageHandler do
  def init({:tcp, :http}, req, state) do
    {:ok, req, state}
  end

  def handle(req, state) do
    headers = [{"content-type", "text/html"}]

    {:ok, resp} = :cowboy_req.reply(200, headers, content_for(state), req)
    {:ok, resp, :state}
  end

  def content_for(:base), do: "<h1>Welcome to Alchemist Camp!</h1>"
  def content_for(:too), do: "<h1>Welcome to TOO</h1>"
  def content_for(:contact), do: "<h1>Look at my github</h1>"
  def content_for(:secret), do: "<h1>Super secret squirrel</h1>"
  def content_for(:others), do: "<h1>I have no idea what you're looking for</h1>"

  def terminate(_reason, _req, _state) do
    :ok
  end
end
