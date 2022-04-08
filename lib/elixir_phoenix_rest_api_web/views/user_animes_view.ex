defmodule ElixirPhoenixRestApiWeb.UserAnimesView do
  use ElixirPhoenixRestApiWeb, :view

  alias ElixirPhoenixRestApi.User.Anime

  def render("create.json", %{
        anime: %Anime{
          id: id,
          title: title,
          year: year,
          score: score,
          genres: genres,
          user_id: user_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Anime Created",
      anime: %{
        id: id,
        title: title,
        year: year,
        score: score,
        genres: genres,
        user_id: user_id,
        inserted_at: inserted_at
      }
    }
  end
end
