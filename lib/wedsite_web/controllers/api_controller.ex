defmodule WedsiteWeb.ApiController do
  use WedsiteWeb, :controller

  alias Wedsite.Repo
  alias Wedsite.Invitation
  alias Wedsite.Guest
  import Ecto.Query, only: [from: 2, order_by: 3]


  def rsvp(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{"status" => "ok"})
  end

  def get_invite(conn, %{"code" => code}) do

     result = with {:ok, invitation} <- get_invitation_by_code(code),
          guests <- (from g in Ecto.assoc(invitation, :guests), order_by: g.inserted_at) |> Repo.all() do

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

  def update_invite(conn, %{"guests" => guests,"invitation" => invitation}) do

    invitation = repo_update_invitation(invitation)

    result = if invitation.accepted == true do
      repo_update_guests(invitation, guests)
    end

    # IO.inspect(result)

    conn
    |> put_status(200)
    |> json(%{"status" => "ok"})
  end

  defp repo_update_invitation(%{"id" => id, "accepted" => accepted, "preferedLang" => lang}) do
    Repo.get!(Invitation, id)
    |> Ecto.Changeset.change(accepted: accepted, lang: lang)
    |> Repo.update!()
  end

  defp repo_update_guests(invitation, guests) do
    guests
    |> Enum.map(&upsert_guest(&1, invitation.id))
  end

  defp upsert_guest(%{
    "coming" => coming,
    "diet_notes" => diet_notes,
    "diet_type" => diet_type,
    "food_choice" => food_choice,
    "food_allergy_notes" => allergy_notes,
    "has_food_allergies" => has_allergies,
    "id" => id,
    "name" => name
  } = guest, invitation_id) do

    if id == nil do
      %Guest{invitation_id: invitation_id}
    else
      Repo.get!(Guest, id)
    end
    |> Guest.changeset(guest)
    |> Repo.insert_or_update!()
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
