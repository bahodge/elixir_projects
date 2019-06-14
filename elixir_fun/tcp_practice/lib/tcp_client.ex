defmodule TcpClient do
  def client do
    {:ok, socket} = :gen_tcp.connect('localhost', 4001, [:binary, active: true])
    client_handler(socket)
  end

  def client_handler(socket) do
    receive do
      {:tcp, ^socket, data} ->
        IO.write(data)
        client_handler(socket)

      {:tcp_closed, ^socket} ->
        IO.puts("------CLOSED------")
    end
  end
end
