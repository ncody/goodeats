defmodule GoodeatsWeb.RestaurantController do
  use GoodeatsWeb, :controller

  alias Goodeats.Blog
  alias Goodeats.Blog.Restaurant

  def new(conn, %{"city_id" => city_id}) do
    city = Blog.get_city!(city_id)
    changeset = Blog.change_restaurant(%Restaurant{})
    render(conn, "new.html", changeset: changeset, city: city)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{
        "country_id" => _country_id,
        "city_id" => city_id,
        "restaurant" => restaurant_params
      }) do
    city = Blog.get_city!(city_id)

    case Blog.create_restaurant(city, restaurant_params) do
      {:ok, _restaurant} ->
        conn
        |> put_flash(:info, "restaurant created")
        |> redirect(to: country_city_path(conn, :show, city.country.id, city))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "error")
        |> redirect(to: country_city_path(conn, :show, city.country.id, city))
    end
  end

  def show(conn, %{"id" => id}) do
    restaurant = Blog.get_restaurant!(id)

    case restaurant do
      nil ->
        render(conn, "missing.html")

      _ ->
        render(conn, "show.html", restaurant: restaurant)
    end
  end

  def edit(conn, %{"id" => id}) do
    restaurant = Blog.get_restaurant!(id)
    changeset = Blog.change_restaurant(restaurant)
    render(conn, "edit.html", restaurant: restaurant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "restaurant" => restaurant_params}) do
    restaurant = Blog.get_restaurant!(id)

    case Blog.update_restaurant(restaurant, restaurant_params) do
      {:ok, restaurant} ->
        conn
        |> put_flash(:info, "Restaurant succssfully updated")
        |> redirect(
          to:
            country_city_restaurant_path(
              conn,
              :show,
              restaurant.city.country.id,
              restaurant.city.id,
              restaurant.id
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", restaurant: restaurant, changeset: changeset)
    end
  end
end
