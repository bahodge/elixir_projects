defmodule FactoryHelper do
  def compile_factories do
    "spec/factories/"
    |> Path.join("**/*.ex")
    |> Path.wildcard()
    |> IO.inspect(label: "WildCard")
    |> Kernel.ParallelCompiler.compile_to_path("../_build/test/lib/factories")
    |> IO.inspect(label: "Result")
  end

  def run_script_factories do
    "spec/factories/"
    |> Path.join("**/*.exs")
    |> Path.wildcard()
    |> Enum.map(&Code.require_file/1)
  end
end

# FactoryHelper.compile_factories()
FactoryHelper.run_script_factories()
