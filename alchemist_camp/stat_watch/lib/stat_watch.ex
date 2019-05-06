defmodule StatWatch do
  @api_key Application.get_env(:stat_watch, :api_key)
  @channel_id Application.get_env(:stat_watch, :channel_id)
  @base_endpoint Application.get_env(:stat_watch, :base_endpoint)

  def start do
    send_request()
    |> parse_response
  end

  def column_names() do
    Enum.join(~w(DateTime Subscribers Videos Views), ",")
  end

  def url() do
    "#{@base_endpoint}channels?#{@channel_id}&#{@api_key}&part=statistics"
  end

  def send_request() do
    HTTPoison.get(url())
  end

  def parse_response(req) do
    {:ok, response} = req

    response
    |> Poison.decode()
  end
end
