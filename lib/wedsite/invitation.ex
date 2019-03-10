defmodule Wedsite.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wedsite.Guest

  @derive {Jason.Encoder, only: [:id, :code, :lang, :max_guests, :guest_count, :children_count, :accepted]}

  schema "invitations" do
    field :code, :string
    field :lang, :string, default: "EN"
    field :max_guests, :integer, default: 2
    field :guest_count, :integer, default: 0
    field :children_count, :integer, default: 0
    field :accepted, :boolean
    field :email, :string
    has_many :guests, Guest


    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:lang, :accepted, :email])
    |> validate_required([:accepted])
  end
end
