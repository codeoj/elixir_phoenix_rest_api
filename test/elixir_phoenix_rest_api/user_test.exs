defmodule ElixirPhoenixRestApi.UserTest do
  use ElixirPhoenixRestApi.DataCase

  alias ElixirPhoenixRestApi.User

  describe "changeset/1" do
    test "when the params are valid, return a changeset" do
      params = %{name: "Misty", password: "12345"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 name: "Misty",
                 password: "12345"
               },
               errors: [],
               data: %ElixirPhoenixRestApi.User{},
               valid?: true
             } = response
    end

    test "when params are invalid, return an invalid changeset" do
      params = %{password: "12345"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 password: "12345"
               },
               data: %ElixirPhoenixRestApi.User{},
               valid?: false
             } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when the params are valid, return an user struct" do
      params = %{name: "Misty", password: "12345"}

      response = User.build(params)

      assert {:ok, %User{name: "Misty", password: "12345"}} = response
    end
  end

  test "when params are invalid, returns an error" do
    params = %{password: "12345"}

    {:error, response} = User.build(params)

    assert %Ecto.Changeset{valid?: false} = response

    assert errors_on(response) == %{name: ["can't be blank"]}
  end
end
