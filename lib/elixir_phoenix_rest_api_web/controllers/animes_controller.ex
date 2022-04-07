defmodule ElixirPhoenixRestApiWeb.AnimesController do
  use ElixirPhoenixRestApiWeb, :controller

  action_fallback ElixirPhoenixRestApiWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ElixirPhoenixRestApi.get_anime()
    |> handle_response(conn)
  end

  defp handle_response({:ok, anime}, conn) do
    conn
    |> put_status(:ok)
    |> json(anime)
  end

  defp handle_response({:error, _anime} = error, _conn), do: error
end
