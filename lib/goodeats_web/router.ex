defmodule GoodeatsWeb.Router do
  use GoodeatsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", GoodeatsWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", CountryController, :index)

    resources("/countries", CountryController) do
      resources("/cities", CityController) do
        resources("/restaurants", RestaurantController)
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", GoodeatsWeb do
  #   pipe_through :api
  # end
end
