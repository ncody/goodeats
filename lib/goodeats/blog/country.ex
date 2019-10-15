defmodule Goodeats.Blog.Country do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "countries" do
    field(:name, :string)
    has_many(:cities, Goodeats.Blog.City)

    timestamps()
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from(country in query,
      where: ilike(country.name, ^wildcard_search)
    )
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
