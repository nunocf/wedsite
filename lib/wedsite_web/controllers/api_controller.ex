defmodule WedsiteWeb.ApiController do
  use WedsiteWeb, :controller

  alias Wedsite.Repo
  alias Wedsite.Invitation

  def rsvp(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{"status" => "ok"})
  end

  def get_invite(conn, %{"code" => code}) do

     result = with {:ok, invitation} <- get_invitation_by_code(code),
          guests <- Ecto.assoc(invitation, :guests) |> Repo.all() do
          {:ok, %{
            invitation: invitation,
            guests: guests
          }}

         else
          {:error, error} ->
            %{error: error}
    end

    response = case result do
      {:ok, data} ->
        %{status: 200, data: data}

      {:err, error} ->
        %{status: 404, error: error}
    end


    conn
    |> put_status(response.status)
    |> json(response)
  end

  def update_invite(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{"status" => "ok"})
  end

  def code(conn, %{"code" => code}) do

    result = case get_invitation_by_code(code) do
      {:error, _} ->
        %{"found" => false}

      {:ok, _} ->
        %{"found" => true}
    end


    conn
    |> put_status(200)
    |> json(result)
  end

  defp get_invitation_by_code(code) do
    case Repo.get_by(Invitation, code: code) do
      nil ->
        {:error, "Not Found"}

      result ->
        {:ok, result}
    end
  end
end
