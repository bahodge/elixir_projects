defmodule TimeFormatter do
  defp local_time do
    :calendar.local_time()
  end

  defp hour do
    {_, {hour, _, _}} = local_time()
    12 - (24 - hour)
  end

  def format_time do
    {_, {_, min, sec}} = local_time()
    "#{hour()}:#{min}:#{sec}"
  end
end
