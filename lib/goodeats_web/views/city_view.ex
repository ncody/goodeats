defmodule GoodeatsWeb.CityView do
  use GoodeatsWeb, :view

  def has_restaurants?(city) do
    length(city.restaurants) > 0
  end

  def tried_restaurants(city) do
    Enum.filter(city.restaurants, fn r -> r.tried == "yes" end)
  end

  def want_to_try_restaurants(city) do
    Enum.filter(city.restaurants, fn r -> r.tried == "want to try" end)
  end

  def other_restaurants(city) do
    Enum.filter(city.restaurants, fn r -> r.tried == "no" end)
  end
end
