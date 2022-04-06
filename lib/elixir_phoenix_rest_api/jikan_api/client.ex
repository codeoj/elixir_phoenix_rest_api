defmodule ElixirPhoenixRestApi.JikanApi.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.jikan.moe/v4"
  plug Tesla.Middleware.JSON

  def get_anime(name) do
    "/anime?q=#{name}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:error, _reason} = error), do: error
end
