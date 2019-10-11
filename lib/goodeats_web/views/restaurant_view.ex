defmodule GoodeatsWeb.RestaurantView do
  use GoodeatsWeb, :view

  def restaurant_status_options() do
    ["no", "yes", "want to try"]
  end
end
