defmodule EspecTests.MixProject do
  use Mix.Project

  def project do
    [
      app: :espec_tests,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [espec: :test],
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ex_machina]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:espec, "~> 1.7.0", only: :test},
      {:ex_machina, "~> 2.3"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "spec/factories/*"]
  defp elixirc_paths(_), do: ["lib", "web"]
end
