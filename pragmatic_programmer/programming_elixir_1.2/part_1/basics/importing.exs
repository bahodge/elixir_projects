defmodule Importing do
  import Importee, only: [:hello]

  def say_hello do
    hello
  end
end
