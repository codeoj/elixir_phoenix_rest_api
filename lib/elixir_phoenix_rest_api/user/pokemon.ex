defmodule ElixirPhoenixRestApi.User.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirPhoenixRestApi.User

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "pokemons" do
    field :name, :string
    field :types, {:array, :string}
    field :moves, {:array, :string}
    belongs_to(:user, User)
    timestamps()
  end

  @required [:name, :types, :moves, :trainer_id]

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
