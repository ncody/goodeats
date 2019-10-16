defmodule GoodeatsWeb.CountryLive.Index do
  use Phoenix.LiveView

  alias GoodeatsWeb.CountryView
  alias Goodeats.Blog

  def mount(%{countries: countries}, socket) do
    {:ok, assign(socket, countries: countries)}
  end

  def render(assigns) do
    CountryView.render("index.html", assigns)
  end

  def handle_event("filter", params, socket) do
    countries = Blog.list_countries(params)
    {:noreply, assign(socket, countries: countries)}
  end
end
