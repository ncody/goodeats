defmodule Goodeats.Account.UserRestaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_restaurants" do
    field(:rating, :integer, default: 0)
    field(:tried, :boolean, default: false)
    field(:notes, :string)
    belongs_to(:user, Goodeats.Account.User)
    belongs_to(:restaurant, Goodeats.Blog.Restaurant)

    timestamps()
  end

  @doc false
  def changeset(user_restaurant, attrs) do
    user_restaurant
    |> cast(attrs, [:tried, :rating, :notes])
    |> validate_required([:tried])
  end
end
