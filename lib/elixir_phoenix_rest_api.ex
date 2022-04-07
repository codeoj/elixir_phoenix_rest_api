defmodule ElixirPhoenixRestApi do
  alias ElixirPhoenixRestApi.{Anime, User}

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate delete_user(params), to: User.Delete, as: :call
  defdelegate get_user(params), to: User.Get, as: :call
  defdelegate update_user(params), to: User.Update, as: :call

  defdelegate get_anime(params), to: Anime.Get, as: :call
end
