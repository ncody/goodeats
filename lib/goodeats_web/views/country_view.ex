defmodule GoodeatsWeb.CountryView do
  use GoodeatsWeb, :view

  def has_cities?(country) do
    length(country.cities) > 0
  end

  def sort_alphabetically(places) do
    Enum.sort_by(places, fn place -> place.name end)
  end
end
