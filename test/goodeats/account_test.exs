defmodule Goodeats.AccountTest do
  use Goodeats.DataCase

  alias Goodeats.Account

  describe "users" do
    alias Goodeats.Account.User

    @valid_attrs %{username: "some username"}
    @update_attrs %{username: "some updated username"}
    @invalid_attrs %{username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "users_restaurants" do
    alias Goodeats.Account.UserRestaurant

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_restaurant_fixture(attrs \\ %{}) do
      {:ok, user_restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user_restaurant()

      user_restaurant
    end

    test "list_users_restaurants/0 returns all users_restaurants" do
      user_restaurant = user_restaurant_fixture()
      assert Account.list_users_restaurants() == [user_restaurant]
    end

    test "get_user_restaurant!/1 returns the user_restaurant with given id" do
      user_restaurant = user_restaurant_fixture()
      assert Account.get_user_restaurant!(user_restaurant.id) == user_restaurant
    end

    test "create_user_restaurant/1 with valid data creates a user_restaurant" do
      assert {:ok, %UserRestaurant{} = user_restaurant} = Account.create_user_restaurant(@valid_attrs)
    end

    test "create_user_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user_restaurant(@invalid_attrs)
    end

    test "update_user_restaurant/2 with valid data updates the user_restaurant" do
      user_restaurant = user_restaurant_fixture()
      assert {:ok, %UserRestaurant{} = user_restaurant} = Account.update_user_restaurant(user_restaurant, @update_attrs)
    end

    test "update_user_restaurant/2 with invalid data returns error changeset" do
      user_restaurant = user_restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user_restaurant(user_restaurant, @invalid_attrs)
      assert user_restaurant == Account.get_user_restaurant!(user_restaurant.id)
    end

    test "delete_user_restaurant/1 deletes the user_restaurant" do
      user_restaurant = user_restaurant_fixture()
      assert {:ok, %UserRestaurant{}} = Account.delete_user_restaurant(user_restaurant)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user_restaurant!(user_restaurant.id) end
    end

    test "change_user_restaurant/1 returns a user_restaurant changeset" do
      user_restaurant = user_restaurant_fixture()
      assert %Ecto.Changeset{} = Account.change_user_restaurant(user_restaurant)
    end
  end
end
