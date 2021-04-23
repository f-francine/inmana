defmodule Inmana.Repo.Migrations.RestaurantsTable do
  use Ecto.Migration

  def change do
    create table("restaurants", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:restaurants, [:email])
  end
end
