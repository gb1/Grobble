defmodule GrobbleWeb.PageController do
  use GrobbleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
