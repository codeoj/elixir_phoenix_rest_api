defmodule ElixirPhoenixRestApi.User.Anime do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirPhoenixRestApi.User

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "animes" do
    field :title, :string
    field :year, :integer
    field :score, :float
    field :genres, {:array, :string}
    belongs_to(:user, User)
    timestamps()
  end

  @required [:title, :year, :score, :genres, :trainer_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
