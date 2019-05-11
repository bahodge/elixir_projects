defmodule EspecTests.Factory do
  # use ExMachina

  def business_operation do
    %Business.Operation{
      owner: "Jane Smith",
      address: "34212 Lockhill"
    }
  end
end
