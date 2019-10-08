defmodule GoodeatsWeb.CountryController do
  use GoodeatsWeb, :controller

  alias Goodeats.Blog
  alias Goodeats.Blog.{Country, City}

  def index(conn, _params) do
    countries = Blog.list_countries()
    render(conn, "index.html", countries: countries)
  end

  def new(conn, _params) do
    changeset = Blog.change_country(%Country{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"country" => country_params}) do
    case Blog.create_country(country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country created successfully.")
        |> redirect(to: country_path(conn, :show, country))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    country = Blog.get_country!(id)
    city_changeset = Blog.change_city(%City{})
    render(conn, "show.html", country: country, city_changeset: city_changeset)
  end

  def edit(conn, %{"id" => id}) do
    country = Blog.get_country!(id)
    changeset = Blog.change_country(country)
    render(conn, "edit.html", country: country, changeset: changeset)
  end

  def update(conn, %{"id" => id, "country" => country_params}) do
    country = Blog.get_country!(id)

    case Blog.update_country(country, country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country updated successfully.")
        |> redirect(to: country_path(conn, :show, country))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", country: country, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    country = Blog.get_country!(id)
    {:ok, _country} = Blog.delete_country(country)

    conn
    |> put_flash(:info, "Country deleted successfully.")
    |> redirect(to: country_path(conn, :index))
  end
end
