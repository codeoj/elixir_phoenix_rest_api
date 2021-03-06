defmodule ElixirPhoenixRestApiWeb.PokemonsController do
  use ElixirPhoenixRestApiWeb, :controller

  action_fallback ElixirPhoenixRestApiWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ElixirPhoenixRestApi.get_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end

  defp handle_response({:error, _pokemon} = error, _conn), do: error
end
