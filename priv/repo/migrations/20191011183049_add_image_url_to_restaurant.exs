defmodule Goodeats.Repo.Migrations.AddImageUrlToRestaurant do
  use Ecto.Migration

  def change do
    alter table(:restaurants) do
      add :image_url, :string
    end
  end
end
