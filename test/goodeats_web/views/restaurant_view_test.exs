defmodule GoodeatsWeb.RestaurantViewTest do
  use GoodeatsWeb.ConnCase, async: true

  alias GoodeatsWeb.RestaurantView

  describe "filter restaurants by tried status" do
    setup do
      tried_restaurant = %{name: "tried restaurant", tried: "yes"}
      want_to_try_restaurant = %{name: "want to try restaurant", tried: "want to try"}
      new_restaurant = %{name: "new restaurant", tried: "no"}

      restaurants = [
        tried_restaurant,
        want_to_try_restaurant,
        new_restaurant
      ]

      {:ok,
       restaurants: restaurants,
       tried_restaurant: tried_restaurant,
       new_restaurant: new_restaurant,
       want_to_try_restaurant: want_to_try_restaurant}
    end

    test "tried_restaurants/1 only returns restaurants with a 'yes' in tried", %{
      restaurants: restaurants,
      tried_restaurant: tried_restaurant
    } do
      tried_restaurants = RestaurantView.tried_restaurants(restaurants)
      assert tried_restaurants == [tried_restaurant]
    end

    test "want_to_try_restaurants/1 only returns restaurants with a 'want to try' in tried", %{
      restaurants: restaurants,
      want_to_try_restaurant: want_to_try_restaurant
    } do
      want_to_try_restaurants = RestaurantView.want_to_try_restaurants(restaurants)
      assert want_to_try_restaurants == [want_to_try_restaurant]
    end

    test "other_restaurant/1 only returns restaurants with a 'no' in tried", %{
      restaurants: restaurants,
      new_restaurant: new_restaurant
    } do
      new_restaurants = RestaurantView.other_restaurants(restaurants)
      assert new_restaurants == [new_restaurant]
    end
  end
end
