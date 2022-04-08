defmodule ElixirPhoenixRestApiWeb.UserAnimesController do
  use ElixirPhoenixRestApiWeb, :controller

  action_fallback ElixirPhoenixRestApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ElixirPhoenixRestApi.create_user_anime()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, anime}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, anime: anime)
  end

  defp handle_response({:error, _result} = error, _conn, _view, _status), do: error
end