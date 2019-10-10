defmodule GoodeatsWeb.CityView do
  use GoodeatsWeb, :view

  def has_restaurants?(city) do
    length(city.restaurants) > 0
  end
end
