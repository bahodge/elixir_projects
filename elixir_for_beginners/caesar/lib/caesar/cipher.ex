defmodule Caesar.Cipher do
  require Logger
  @alphabet_size Application.get_env(:caesar, :alphabet_size)

  @moduledoc """
  Caesar Cipher Module, which maps chars to new chars

  """

  @doc """
    Encryp the mssage by applying a mapping that shifts the alphabet by the `shift ` value

    ## Examples

      iex> Caesar.Cipher.encrypt("hello world", 1)
      "gdkkn vnqkc"

  """

  def encrypt(msg, shift) do
    Logger.debug("encrypting \"#{msg}\" with a shift number: #{shift}")
    # convert this message into a char_list
    msg
    |> to_charlist
    |> Enum.map(&shift_char(&1, shift))
    |> List.to_string()

    # iterate over the list apply shift mapping

    # return list as a binary string.
  end

  defp shift_char(char, shift) do
    case char do
      chr when chr in ?a..?z -> calculate_mapping(?a, chr, shift)
      chr when chr in ?A..?Z -> calculate_mapping(?A, chr, shift)
      chr -> chr
    end
  end

  def calculate_mapping(base_letter, char, shift) do
    # find the ASCII integer of the char and normalize it

    normalize = &(&1 - @alphabet_size)
    # subtract the size of the alphabet
    shift_num = rem(shift, @alphabet_size)

    base_letter + rem(char - normalize.(base_letter) - shift_num, 26)
  end
end
