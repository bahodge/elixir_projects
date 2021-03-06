defmodule WordCounter.MixProject do
  use Mix.Project

  def project do
    [
      app: :word_counter,
      version: "0.1.0",
      elixir: "~> 1.8",
      escript: [main_module: WordCount.CLI],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    []
  end
end
