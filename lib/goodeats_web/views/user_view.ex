defmodule GoodeatsWeb.UserView do
  use GoodeatsWeb, :view

  def tried_restaurants(users_restaurants) do
    Enum.filter(users_restaurants, fn r -> r.tried == "yes" end)
  end

  def want_to_try_restaurants(users_restaurants) do
    Enum.filter(users_restaurants, fn r -> r.tried == "want to try" end)
  end
end
