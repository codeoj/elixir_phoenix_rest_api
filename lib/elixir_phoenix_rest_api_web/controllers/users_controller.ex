defmodule ElixirPhoenixRestApiWeb.UsersController do
  use ElixirPhoenixRestApiWeb, :controller

  action_fallback ElixirPhoenixRestApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ElixirPhoenixRestApi.create_user()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ElixirPhoenixRestApi.get_user()
    |> handle_response(conn, "show.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ElixirPhoenixRestApi.delete_user()
    |> handle_delete(conn)
  end

  def update(conn, params) do
    params
    |> ElixirPhoenixRestApi.update_user()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, user}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, user: user)
  end

  defp handle_response({:error, _result} = error, _conn, _view, _status), do: error

  defp handle_delete({:ok, _user}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _message} = error, _conn), do: error
end
