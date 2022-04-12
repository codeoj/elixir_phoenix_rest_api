defmodule ElixirPhoenixRestApi.User.CreateTest do
  use ElixirPhoenixRestApi.DataCase

  alias ElixirPhoenixRestApi.{Repo, User}
  alias User.Create

  describe "call/1" do
    test "when params are valid, create an user" do
      params = %{name: "Ash", password: "12345"}

      count_before = Repo.aggregate(User, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(User, :count)

      assert {:ok, %User{name: "Ash"}} = response
      assert count_after > count_before
    end

    test "when params are invalid, return an error" do
      params = %{name: "Ash"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
