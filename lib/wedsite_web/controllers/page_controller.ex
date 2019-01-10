defmodule WedsiteWeb.PageController do
  use WedsiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
