defmodule Wedsite.Invitation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "invitations" do
    field :code, :string
    field :lang, :string
    field :max_size, :integer
    field :need_transport, :boolean, default: false
    field :size, :integer

    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:lang, :max_size, :size, :code, :need_transport])
    |> validate_required([:lang, :max_size, :size, :code, :need_transport])
  end
end
