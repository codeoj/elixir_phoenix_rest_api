defmodule ElixirPhoenixRestApi.User.Pokemon.Get do
  alias ElixirPhoenixRestApi.{User.Pokemon, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon does not exist"}
      pokemon -> {:ok, Repo.preload(pokemon, :user)}
    end
  end
end
