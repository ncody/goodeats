defmodule GoodeatsWeb.Router do
  use GoodeatsWeb, :router

  # import Phoenix.LiveView.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(Phoenix.LiveView.Flash)
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

    resources("/users", UserController) do
      resources("/user_restaurants", UserRestaurantController)
    end

    resources("/countries", CountryController) do
      resources("/cities", CityController) do
        resources("/restaurants", RestaurantController)
        get("/restaurants/:id/image_url", RestaurantController, :new_image)
        post("/restaurant/:id/image_url", RestaurantController, :create_image)
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", GoodeatsWeb do
  #   pipe_through :api
  # end
end
