defmodule GoodeatsWeb.RestaurantView do
  use GoodeatsWeb, :view

  def restaurant_status_options() do
    ["no", "yes", "want to try"]
  end

  def display_rating(restaurant) do
    case restaurant.tried do
      "yes" ->
        case restaurant.rating do
          0 -> raw('<p>your rating: not rated</p>')
          1 -> raw('<p>your rating: &#9733; &#9734; &#9734; &#9734; &#9734;</p>')
          2 -> raw('<p>your rating: &#9733; &#9733; &#9734; &#9734; &#9734;</p>')
          3 -> raw('<p>your rating: &#9733; &#9733; &#9733; &#9734; &#9734;</p>')
          4 -> raw('<p>your rating: &#9733; &#9733; &#9733; &#9733; &#9734;</p>')
          5 -> raw('<p>your rating: &#9733; &#9733; &#9733; &#9733; &#9733;</p>')
        end

      _ ->
        nil
    end
  end

  def tried_restaurants(restaurants) do
    Enum.filter(restaurants, fn r -> r.tried == "yes" end)
  end

  def want_to_try_restaurants(restaurants) do
    Enum.filter(restaurants, fn r -> r.tried == "want to try" end)
  end

  def other_restaurants(restaurants) do
    Enum.filter(restaurants, fn r -> r.tried == "no" end)
  end

  def has_image?(restaurant) do
    restaurant.image_url != nil
  end
end
