defmodule ElixirPhoenixRestApiWeb.UserPokemonsView do
  use ElixirPhoenixRestApiWeb, :view

  alias ElixirPhoenixRestApi.User.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          types: types,
          moves: moves,
          user_id: user_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Pokemon Created",
      pokemon: %{
        id: id,
        name: name,
        types: types,
        moves: moves,
        user_id: user_id,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          types: types,
          moves: moves,
          user: %{id: user_id, name: user_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      pokemon: %{
        id: id,
        name: name,
        types: types,
        moves: moves,
        user: %{user_id: user_id, user_name: user_name},
        inserted_at: inserted_at
      }
    }
  end
end
