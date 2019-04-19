defmodule CaptureSyntax do

    def run_function(10) do
       &(&1 + 1000)
    end
end