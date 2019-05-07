words =
  String.split(
    File.read!("../greeter/greeter.exs"),
    ~r{(\\n|[^\w'])+}
  )

IO.puts("There are #{Enum.count(words)} words in this file")
