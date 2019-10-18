defmodule GoodeatsWeb.UserRestaurantControllerTest do
  use GoodeatsWeb.ConnCase

  alias Goodeats.Account

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:user_restaurant) do
    {:ok, user_restaurant} = Account.create_user_restaurant(@create_attrs)
    user_restaurant
  end

  describe "index" do
    test "lists all users_restaurants", %{conn: conn} do
      conn = get(conn, Routes.user_restaurant_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Users restaurants"
    end
  end

  describe "new user_restaurant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_restaurant_path(conn, :new))
      assert html_response(conn, 200) =~ "New User restaurant"
    end
  end

  describe "create user_restaurant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_restaurant_path(conn, :create), user_restaurant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_restaurant_path(conn, :show, id)

      conn = get(conn, Routes.user_restaurant_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User restaurant"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_restaurant_path(conn, :create), user_restaurant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User restaurant"
    end
  end

  describe "edit user_restaurant" do
    setup [:create_user_restaurant]

    test "renders form for editing chosen user_restaurant", %{conn: conn, user_restaurant: user_restaurant} do
      conn = get(conn, Routes.user_restaurant_path(conn, :edit, user_restaurant))
      assert html_response(conn, 200) =~ "Edit User restaurant"
    end
  end

  describe "update user_restaurant" do
    setup [:create_user_restaurant]

    test "redirects when data is valid", %{conn: conn, user_restaurant: user_restaurant} do
      conn = put(conn, Routes.user_restaurant_path(conn, :update, user_restaurant), user_restaurant: @update_attrs)
      assert redirected_to(conn) == Routes.user_restaurant_path(conn, :show, user_restaurant)

      conn = get(conn, Routes.user_restaurant_path(conn, :show, user_restaurant))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_restaurant: user_restaurant} do
      conn = put(conn, Routes.user_restaurant_path(conn, :update, user_restaurant), user_restaurant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User restaurant"
    end
  end

  describe "delete user_restaurant" do
    setup [:create_user_restaurant]

    test "deletes chosen user_restaurant", %{conn: conn, user_restaurant: user_restaurant} do
      conn = delete(conn, Routes.user_restaurant_path(conn, :delete, user_restaurant))
      assert redirected_to(conn) == Routes.user_restaurant_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_restaurant_path(conn, :show, user_restaurant))
      end
    end
  end

  defp create_user_restaurant(_) do
    user_restaurant = fixture(:user_restaurant)
    {:ok, user_restaurant: user_restaurant}
  end
end
