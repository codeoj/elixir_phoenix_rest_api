defmodule ElixirPhoenixRestApiWeb.FallbackController do
  use ElixirPhoenixRestApiWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ElixirPhoenixRestApiWeb.ErrorView)
    |> render("400.josn", result: result)
  end
end
