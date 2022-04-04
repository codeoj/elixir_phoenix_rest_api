defmodule ElixirPhoenixRestApi.User.Get do
  alias ElixirPhoenixRestApi.{User, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:erro, "User does not exist"}
      user -> {:ok, user}
    end
  end
end
