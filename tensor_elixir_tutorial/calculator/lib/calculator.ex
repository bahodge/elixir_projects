defmodule Calculator do
  def start do
    spawn(fn -> loop(0) end)
  end

# private method that can only be called in this module
  defp loop(current_value) do
    new_value = receive do
      {:value, client_id} -> send(client_id, {:response, current_value})
      current_value
      {:add, value} -> current_value + value
      {:subtract, value} -> current_value - value
      {:multiply, value} -> current_value * value
      {:divide, value} -> current_value / value

      invalid_request -> IO.puts("Invalide Request #{inspect invalid_request}")
        current_value

    end
    loop(new_value)
  end

  def value(server_id) do
    send(server_id, {:value, self()}) 
    receive do
      {:response, value} -> value
    end
  end

  def add(server_id, value) do
   send(server_id, {:add, value})
   value(server_id)
  end

  def subtract(server_id, value) do
    send(server_id, {:subtract, value})
    value(server_id)
  end

  def multiply(server_id, value) do
    send(server_id, {:multiply, value})
    value(server_id)
  end

  def divide(server_id, value) do
    send(server_id, {:divide, value})
    value(server_id)
  end

end