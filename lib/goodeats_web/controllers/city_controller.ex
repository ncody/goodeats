defmodule GoodeatsWeb.CityController do
  use GoodeatsWeb, :controller

  alias Goodeats.Blog
  alias Goodeats.Blog.Restaurant

  def create(conn, %{"country_id" => country_id, "city" => city_params}) do
    country = Blog.get_country!(country_id)

    case Blog.create_city(country, city_params) do
      {:ok, _city} ->
        conn
        |> put_flash(:info, "city added")
        |> redirect(to: country_path(conn, :show, country))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "issue creating city")
        |> redirect(to: country_path(conn, :show, country))
    end
  end

  def show(conn, %{"id" => id}) do
    city = Blog.get_city!(id)
    restaurant_changeset = Blog.change_restaurant(%Restaurant{})
    render(conn, "show.html", city: city, restaurant_changeset: restaurant_changeset)
  end
end
