defmodule ElixirPhoenixRestApiWeb.UsersController do
  use ElixirPhoenixRestApiWeb, :controller

  action_fallback ElixirPhoenixRestApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ElixirPhoenixRestApi.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, _result} = error, _conn), do: error
end
