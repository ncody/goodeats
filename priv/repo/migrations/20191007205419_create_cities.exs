defmodule Goodeats.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add(:name, :string)
      add(:country_id, references(:countries, on_delete: :delete_all))

      timestamps()
    end

    create(index(:cities, [:country_id]))
  end
end
