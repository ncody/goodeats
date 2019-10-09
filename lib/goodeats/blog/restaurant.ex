defmodule Goodeats.Blog.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field(:cuisine, :string)
    field(:description, :string)
    field(:name, :string)
    field(:rating, :integer, default: 0)
    field(:tried, :string, default: "no")
    belongs_to(:city, Goodeats.Blog.City)

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs \\ %{}) do
    restaurant
    |> cast(attrs, [:name, :cuisine, :description, :tried, :rating])
    |> validate_required([:name, :cuisine, :tried, :rating])
  end
end
