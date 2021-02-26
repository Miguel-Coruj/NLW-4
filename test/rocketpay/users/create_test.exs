defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns and user" do
      params = %{
        name: "Miguel",
        password: "123456",
        nickname: "migueltirono.",
        email: "miguellopes@gmail.com",
        age: 18
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Miguel", age: 18, id: ^user_id} = user
    end

    test "when all are invalid params, returns and error" do
      params = %{
        name: "Miguel",
        password: "123456",
        nickname: "migueltirono.",
        email: "miguellopes@gmail.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
