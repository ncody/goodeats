defmodule Goodeats.Blog.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field(:cuisine, :string)
    field(:description, :string)
    field(:name, :string)
    field(:image_url, :string)
    belongs_to(:city, Goodeats.Blog.City)
    has_many(:users_restaurants, Goodeats.Account.UserRestaurant)

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs \\ %{}) do
    restaurant
    |> cast(attrs, [:name, :cuisine, :description, :image_url])
    |> validate_required([:name, :cuisine])
  end
end
