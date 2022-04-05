defmodule ElixirPhoenixRestApiWeb.UsersView do
  use ElixirPhoenixRestApiWeb, :view

  alias ElixirPhoenixRestApi.User

  def render("create.json", %{user: %User{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{user: %User{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        user: %User{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
      }) do
    %{
      message: "User Updated",
      user: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end
end
