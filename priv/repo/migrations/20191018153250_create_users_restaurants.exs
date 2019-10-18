defmodule Goodeats.Repo.Migrations.CreateUsersRestaurants do
  use Ecto.Migration

  def change do
    create table(:users_restaurants) do
      add(:tried, :string, default: "no")
      add(:rating, :integer, default: 0)
      add(:notes, :text)
      add(:user_id, references(:users))
      add(:restaurant_id, references(:restaurants))

      timestamps()
    end
  end
end
