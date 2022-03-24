defmodule ElixirPhoenixRestApiWeb.WelcomeController do
  use ElixirPhoenixRestApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to the API")
  end
end
