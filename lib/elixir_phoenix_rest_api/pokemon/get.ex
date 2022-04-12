defmodule ElixirPhoenixRestApi.Pokemon.Get do
  alias ElixirPhoenixRestApi.PokeApi.Client
  alias ElixirPhoenixRestApi.Pokemon

  def call(name) do
    name
    |> Client.get_pokemon()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, Pokemon.build(body)}
  defp handle_response({:error, _body} = error), do: error
end
