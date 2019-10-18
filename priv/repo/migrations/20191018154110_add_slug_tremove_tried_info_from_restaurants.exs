defmodule Goodeats.Repo.Migrations.AddSlugTremoveTriedInfoFromRestaurants do
  use Ecto.Migration

  def change do
    alter table(:restaurants) do
      remove(:tried)
      remove(:rating)
    end
  end
end
