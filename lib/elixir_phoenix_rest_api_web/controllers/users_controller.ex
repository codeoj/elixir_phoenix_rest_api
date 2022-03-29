defmodule ElixirPhoenixRestApiWeb.UsersController do
  use ElixirPhoenixRestApiWeb, :controller

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
end
