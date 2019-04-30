defmodule Sequence1.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequence1,
      version: "0.1.2",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Sequence1.Application, []},
      env: [initial_number: 543],
      registered: [Sequence1.Server]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exrm, "~> 1.0.8"}
    ]
  end
end
