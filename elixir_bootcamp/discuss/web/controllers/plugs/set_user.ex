defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  #plugs must have 1 init
  # called when boot

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    # condition statement
    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)

    end
  end

#  def get_session(conn, :user_id) do
#
#  end

  # plugs must have 1 call
  # must receive connection
  # must return connection
  # called every time fed through plug


end