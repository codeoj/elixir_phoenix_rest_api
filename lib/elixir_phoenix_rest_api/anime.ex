defmodule ElixirPhoenixRestApi.Anime do
  @keys [:id, :title, :year, :score, :genres]
  @enforce_keys @keys
  @derive Jason.Encoder

  defstruct @keys

  def build(%{"id" => id, "title" => title, "year" => year, "score" => score, "genres" => genres}) do
    %__MODULE__{
      id: id,
      title: title,
      year: year,
      score: score,
      genres: parse_genres(genres)
    }
  end

  defp parse_genres(genres), do: Enum.map(genres, fn item -> item["name"] end)
end
