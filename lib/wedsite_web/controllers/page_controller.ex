defmodule WedsiteWeb.PageController do
  use WedsiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def code(conn, _params) do
    render(conn, "index.html")
  end

  def form(conn, _params) do
    render(conn, "index.html")
  end

  def complete(conn, _params) do
    render(conn, "index.html")
  end
end
