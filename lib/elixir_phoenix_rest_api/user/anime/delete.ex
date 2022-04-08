defmodule ElixirPhoenixRestApi.User.Anime.Delete do
  alias ElixirPhoenixRestApi.{User.Anime, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_anime(uuid) do
      nil -> {:erro, "Anime does not exist"}
      anime -> Repo.delete(anime)
    end
  end

  defp fetch_anime(uuid), do: Repo.get(Anime, uuid)
end
