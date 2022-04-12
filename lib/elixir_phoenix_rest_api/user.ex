defmodule ElixirPhoenixRestApi.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirPhoenixRestApi.User.Pokemon

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many(:pokemon, Pokemon)
    timestamps()
  end

  @required_params [:name, :password]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(user, params), do: create_changeset(user, params)
  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module_or_user, params) do
    module_or_user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 5)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
