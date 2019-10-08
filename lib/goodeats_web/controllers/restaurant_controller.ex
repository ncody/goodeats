defmodule GoodeatsWeb.RestaurantController do
  use GoodeatsWeb, :controller

  alias Goodeats.Blog

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
    render(conn, "show.html", restaurant: restaurant)
  end
end
