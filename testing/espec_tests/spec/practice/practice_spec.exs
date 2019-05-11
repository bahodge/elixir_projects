defmodule PracticeTests do
  use ESpec

  example_group do
    context "Some context" do
      it(do: expect("abc" |> to(match(~r/b/))))
    end

    describe "Some another context with opts", focus: true do
      it(do: 5 |> should(be_between(4, 6)))
    end
  end

  describe "#my_pending_function" do
    # pending("pending")
    # specify("Test with options", [pending: true], do: :pending)
    # xit("skip", do: "skipped")
  end

  describe "this is a failing test" do
    # example(do: (1 + 2) |> to(eq(75000)))
  end

  describe "#these are the same thing" do
    example(do: expect([1, 2, 3] |> to(have_max(3))))

    it "Test with description" do
      4.2 |> should(be_close_to(4, 0.5))
    end
  end

  describe "skipped example" do
    focus("Focused", do: "Focused example")
  end
end

defmodule TheModule do
  def fun, do: :fun
end

defmodule TheModuleSpec do
  use ESpec
  it(do: expect(described_module().fun |> to(eq(:fun))))
end
