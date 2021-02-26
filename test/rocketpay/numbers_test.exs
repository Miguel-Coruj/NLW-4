defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with then give name, returns the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expeted_response = {:ok, %{result: 37}}

      assert response == expeted_response
    end

    test "when there is no file with then give name, returns and error" do
      response = Numbers.sum_from_file("banana")

      expeted_response = {:error, %{message: "Invalid File!"}}

      assert response == expeted_response
    end
  end
end
