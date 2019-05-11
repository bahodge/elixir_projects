defmodule Business.OperationSpec do
  use ESpec
  use ExMachina

  subject(described_module())

  describe "add_numbers" do
    context "when input is numbers" do
      let(arg_1: 1, arg_2: 2)

      it "adds the numbers" do
        expect(subject().add_numbers(arg_1(), arg_2())) |> to(eq({:ok, 3}))
      end
    end

    context "when input is tuple" do
      let(args: {1, 2})

      it "adds numbers" do
        expect(subject().add_numbers(args())) |> to(eq({:ok, 3}))
      end
    end
  end

  describe "do_work" do
    let(arg_1: {3, 5})
    let(arg_2: {2, 4})

    it "adds numbers than subtracts sums" do
      expect(subject().do_work(arg_1(), arg_2())) |> to(eq({:ok, 2}))
    end
  end
end
