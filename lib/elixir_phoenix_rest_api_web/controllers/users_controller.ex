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

  def delete(conn, %{"id" => id}) do
    id
    |> ElixirPhoenixRestApi.delete_user()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _user}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _message} = error, _conn), do: error
end
