defmodule ExampleSharedSpec do
  use ESpec, shared: true

  example_group do
    context "Some context" do
      it(do: expect("abc" |> to(match(~r/b/))))
    end

    describe "Some another context with opts", focus: true do
      it(do: 5 |> should(be_between(4, 6)))
    end
  end
end
