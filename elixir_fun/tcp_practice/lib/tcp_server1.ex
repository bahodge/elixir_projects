defmodule TcpServer1 do
  def server do
    {:ok, listen_socket} = :gen_tcp.listen(4001, [:binary, reuseaddr: true])
    for _ <- 0..10, do: spawn(fn -> server_handler(listen_socket) end)
    Process.sleep(:infinity)
    # server_handler(listen_socket)
  end

  def server_handler(listen_socket) do
    {:ok, socket} = :gen_tcp.accept(listen_socket)
    :ok = :gen_tcp.send(socket, "HELLO?")

    receive do
      {:tcp, ^socket, data} ->
        :ok = :gen_tcp.send(socket, "Hello, #{data}\r\n")
    end

    :ok = :gen_tcp.shutdown(socket, :read_write)
    server_handler(listen_socket)
  end
end
