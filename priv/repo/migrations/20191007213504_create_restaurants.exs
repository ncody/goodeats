defmodule Goodeats.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add(:name, :string)
      add(:cuisine, :string)
      add(:description, :text)
      add(:tried, :string, default: "no")
      add(:rating, :integer, default: 0)
      add(:city_id, references(:cities, on_delete: :delete_all))

      timestamps()
    end

    create(index(:restaurants, [:city_id]))
  end
end
