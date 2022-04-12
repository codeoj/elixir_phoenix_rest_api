defmodule ElixirPhoenixRestApi.User.Pokemon.Create do
  alias ElixirPhoenixRestApi.PokeApi.Client
  alias ElixirPhoenixRestApi.Pokemon
  alias ElixirPhoenixRestApi.User.Pokemon, as: UserPokemon
  alias ElixirPhoenixRestApi.Repo

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Pokemon.build()
    |> create_pokemon(params)
  end

  defp handle_response({:error, _message} = error, _params), do: error

  defp create_pokemon(%Pokemon{name: name, types: types, moves: moves}, %{
         "user_id" => user_id
       }) do
    params = %{
      name: name,
      types: types,
      moves: moves,
      user_id: user_id
    }

    params
    |> UserPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
