defmodule TcpClient1 do
  def client do
    {:ok, socket} = :gen_tcp.connect('localhost', 4001, [:binary, active: true])
    client_handler(socket)
  end

  def client_handler(socket) do
    receive do
      {:tcp, ^socket, "HELLO?"} ->
        name = IO.gets("Enter your name: ") |> String.trim()
        :ok = :gen_tcp.send(socket, name)
        client_handler(socket)

      {:tcp, ^socket, data} ->
        IO.write(data)
        client_handler(socket)

      {:tcp_closed, ^socket} ->
        IO.puts("------CLOSED------")
    end
  end
end
