defmodule ElixirPhoenixRestApi.Repo.Migrations.AddAnimesTable do
  use Ecto.Migration

  def change do
    create table(:animes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :year, :integer
      add :score, :float
      add :genres, {:array, :string}
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
