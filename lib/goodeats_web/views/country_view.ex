defmodule GoodeatsWeb.CountryView do
  use GoodeatsWeb, :view

  def has_cities?(country) do
    length(country.cities) > 0
  end
end
