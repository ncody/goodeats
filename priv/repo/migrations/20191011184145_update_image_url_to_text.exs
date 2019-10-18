defmodule Goodeats.Repo.Migrations.UpdateImageUrlToText do
  use Ecto.Migration

  def change do
    alter table(:restaurants) do
      modify(:image_url, :text)
    end
  end
end
