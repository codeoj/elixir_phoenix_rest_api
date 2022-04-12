defmodule ElixirPhoenixRestApi do
  alias ElixirPhoenixRestApi.{Pokemon, User}
  alias ElixirPhoenixRestApi.User.Pokemon, as: UserPokemon

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate delete_user(params), to: User.Delete, as: :call
  defdelegate get_user(params), to: User.Get, as: :call
  defdelegate update_user(params), to: User.Update, as: :call

  defdelegate get_pokemon(params), to: Pokemon.Get, as: :call

  defdelegate create_user_pokemon(params), to: UserPokemon.Create, as: :call
  defdelegate delete_user_pokemon(params), to: UserPokemon.Delete, as: :call
  defdelegate get_user_pokemon(params), to: UserPokemon.Get, as: :call
end
