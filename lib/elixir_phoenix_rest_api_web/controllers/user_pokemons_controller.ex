defmodule ElixirPhoenixRestApiWeb.UserPokemonsController do
  use ElixirPhoenixRestApiWeb, :controller

  action_fallback ElixirPhoenixRestApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ElixirPhoenixRestApi.create_user_pokemon()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ElixirPhoenixRestApi.delete_user_pokemon()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ElixirPhoenixRestApi.get_user_pokemon()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, pokemon}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end

  defp handle_response({:error, _result} = error, _conn, _view, _status), do: error
end
