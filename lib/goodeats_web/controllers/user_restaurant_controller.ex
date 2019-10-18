defmodule GoodeatsWeb.UserRestaurantController do
  use GoodeatsWeb, :controller

  alias Goodeats.Account
  alias Goodeats.Account.UserRestaurant

  def index(conn, %{"user_id" => user_id}) do
    users_restaurants = Account.list_users_restaurants()
    render(conn, "index.html", users_restaurants: users_restaurants)
  end

  def new(conn, _params) do
    changeset = Account.change_user_restaurant(%UserRestaurant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_id" => user_id, "user_restaurant" => user_restaurant_params}) do
    user = Account.get_user!(user_id)

    case Account.create_user_restaurant(user_restaurant_params) do
      {:ok, _user_restaurant} ->
        conn
        |> put_flash(:info, "User restaurant created successfully.")
        |> redirect(to: user_path(conn, :show, user.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_restaurant = Account.get_user_restaurant!(id)
    render(conn, "show.html", user_restaurant: user_restaurant)
  end

  def edit(conn, %{"id" => id}) do
    user_restaurant = Account.get_user_restaurant!(id)
    changeset = Account.change_user_restaurant(user_restaurant)
    render(conn, "edit.html", user_restaurant: user_restaurant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_restaurant" => user_restaurant_params}) do
    user_restaurant = Account.get_user_restaurant!(id)

    case Account.update_user_restaurant(user_restaurant, user_restaurant_params) do
      {:ok, user_restaurant} ->
        conn
        |> put_flash(:info, "User restaurant updated successfully.")
        |> redirect(to: user_path(conn, :show, user_restaurant.user_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_restaurant: user_restaurant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_restaurant = Account.get_user_restaurant!(id)
    user_id = user_restaurant.user_id
    {:ok, _user_restaurant} = Account.delete_user_restaurant(user_restaurant)

    conn
    |> put_flash(:info, "User restaurant deleted successfully.")
    |> redirect(to: user_path(conn, :index, user_id))
  end
end
