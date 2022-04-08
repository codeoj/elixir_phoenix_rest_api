defmodule ElixirPhoenixRestApi.User.Anime.Create do
  alias ElixirPhoenixRestApi.JikanApi.Client
  alias ElixirPhoenixRestApi.Anime
  alias ElixirPhoenixRestApi.User.Anime, as: UserAnime
  alias ElixirPhoenixRestApi.Repo

  def call(%{"name" => name} = params) do
    name
    |> Client.get_anime()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Anime.build()
    |> create_anime(params)
  end

  defp handle_response({:error, _message} = error, _params), do: error

  defp create_anime(%Anime{title: title, year: year, score: score, genres: genres}, %{
         "user_id" => user_id
       }) do
    params = %{
      title: title,
      year: year,
      score: score,
      genres: genres,
      user_id: user_id
    }

    params
    |> UserAnime.build()
    |> handle_build()
  end

  defp handle_build({:ok, anime}), do: Repo.insert(anime)
  defp handle_build({:error, _changeset} = error), do: error
end
