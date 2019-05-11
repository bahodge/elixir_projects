# defmodule Cookies.Cookie do
#   use Pavlov.Case, async: true
#   import Pavlov.Syntax.Expect

#   describe "Numbers" do
#     subject(do: 5)

#     context "straight up, no message" do
#       it(is_expected |> to_eq(5))
#     end

#     context "you can also use a custom message" do
#       it "is equal to 5" do
#         is_expected |> to_eq(5)
#       end
#     end
#   end
# end
