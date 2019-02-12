defmodule Wedsite.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wedsite.Guest

  @derive {Jason.Encoder, only: [:code, :lang, :max_size, :size, :need_transport]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "invitations" do
    field :code, :string
    field :lang, :string
    field :max_size, :integer
    field :need_transport, :boolean, default: false
    field :size, :integer
    has_many :guests, Guest


    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:lang, :need_transport, :max_size, :size, :code])
    |> validate_required([:lang, :need_transport, :max_size, :size, :code])
  end
end
