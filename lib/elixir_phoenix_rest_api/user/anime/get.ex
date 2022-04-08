defmodule ElixirPhoenixRestApi.User.Anime.Get do
  alias ElixirPhoenixRestApi.{User.Anime, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Anime, uuid) do
      nil -> {:error, "Anime does not exist"}
      anime -> {:ok, Repo.preload(anime, :user)}
    end
  end
end
