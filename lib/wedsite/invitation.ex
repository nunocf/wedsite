defmodule Wedsite.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wedsite.Guest

  @derive {Jason.Encoder, only: [:id, :code, :lang, :max_guests, :guest_count, :children_count, :coming]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "invitations" do
    field :code, :string
    field :lang, :string, default: "EN"
    field :max_guests, :integer, default: 2
    field :guest_count, :integer, default: 0
    field :children_count, :integer, default: 0
    field :coming, :boolean, default: true
    has_many :guests, Guest


    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:lang, :coming])
    |> validate_required([:coming])
  end
end
