defmodule Goodeats.BlogTest do
  use Goodeats.DataCase

  alias Goodeats.Blog

  describe "countries" do
    alias Goodeats.Blog.Country

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def country_fixture(attrs \\ %{}) do
      {:ok, country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_country()

      country
    end

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Blog.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Blog.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      assert {:ok, %Country{} = country} = Blog.create_country(@valid_attrs)
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      assert {:ok, country} = Blog.update_country(country, @update_attrs)
      assert %Country{} = country
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_country(country, @invalid_attrs)
      assert country == Blog.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Blog.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Blog.change_country(country)
    end
  end

  describe "cities" do
    alias Goodeats.Blog.{Country, City}

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}
    @country %Country{name: "country name"}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Blog.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Blog.get_city!(city.id) == city
    end

    test "create_city/2 with valid data creates a city" do
      assert {:ok, %City{} = city} = Blog.create_city(@country, @valid_attrs)
      assert city.name == "some name"
    end

    test "create_city/2 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_city(@country, @invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, city} = Blog.update_city(city, @update_attrs)
      assert %City{} = city
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_city(city, @invalid_attrs)
      assert city == Blog.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Blog.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Blog.change_city(city)
    end
  end

  describe "restaurants" do
    alias Goodeats.Blog.{Restaurant, City}

    @valid_attrs %{
      cuisine: "some cuisine",
      description: "some description",
      name: "some name",
      rating: 42,
      tried: true
    }
    @update_attrs %{
      cuisine: "some updated cuisine",
      description: "some updated description",
      name: "some updated name",
      rating: 43,
      tried: false
    }
    @invalid_attrs %{cuisine: nil, description: nil, name: nil, rating: nil, tried: nil}
    @city %City{name: "city name"}

    def restaurant_fixture(attrs \\ %{}) do
      {:ok, restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_restaurant()

      restaurant
    end

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Blog.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Blog.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/2 with valid data creates a restaurant" do
      assert {:ok, %Restaurant{} = restaurant} = Blog.create_restaurant(@city, @valid_attrs)
      assert restaurant.cuisine == "some cuisine"
      assert restaurant.description == "some description"
      assert restaurant.name == "some name"
      assert restaurant.rating == 42
      assert restaurant.tried == true
    end

    test "create_restaurant/2 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_restaurant(@city, @invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, restaurant} = Blog.update_restaurant(restaurant, @update_attrs)
      assert %Restaurant{} = restaurant
      assert restaurant.cuisine == "some updated cuisine"
      assert restaurant.description == "some updated description"
      assert restaurant.name == "some updated name"
      assert restaurant.rating == 43
      assert restaurant.tried == false
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Blog.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Blog.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Blog.change_restaurant(restaurant)
    end
  end
end
