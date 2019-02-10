defmodule WedsiteWeb.ApiController do
  use WedsiteWeb, :controller

  def rsvp(conn, _params) do

    conn
    |> put_status(200)
    |> json(%{"status" => "ok"})
  end

  def code(conn, params) do
    IO.inspect(params)
    conn
    |> put_status(200)
    |> json(%{"status" => "ok"})
  end
end
