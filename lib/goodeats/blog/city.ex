defmodule Goodeats.Blog.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field(:name, :string)
    belongs_to(:country, Goodeats.Blog.Country)
    has_many(:restaurants, Goodeats.Blog.Restaurant)

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
