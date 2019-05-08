defmodule PavlovTests.MixProject do
  use Mix.Project

  def project do
    [
      app: :pavlov_tests,
      version: "0.1.0",
      elixir: "~> 1.8",
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
    [{:pavlov, ">= 0.1.0", only: :test}, {:ex_machina, "~> 2.3"}]
  end
end
