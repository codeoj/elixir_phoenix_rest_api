defmodule ElixirPhoenixRestApi.Anime.Get do
  alias ElixirPhoenixRestApi.JikanApi.Client
  alias ElixirPhoenixRestApi.Anime

  def call(name) do
    name
    |> Client.get_anime()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, Anime.build(body)}
  defp handle_response({:error, _body} = error), do: error
end
