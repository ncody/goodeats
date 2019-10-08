defmodule GoodeatsWeb.PageController do
  use GoodeatsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
