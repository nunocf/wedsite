defmodule Wedsite.Guest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wedsite.Invitation

  @derive {Jason.Encoder, only: [:coming, :diet_notes, :food_choice, :has_special_diet, :name]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "guests" do
    field :coming, :boolean, default: false
    field :diet_notes, :string
    field :food_choice, :string
    field :has_special_diet, :boolean, default: false
    field :name, :string
    belongs_to :invitations, Invitation, foreign_key: :invitation_id

    timestamps()
  end

  @doc false
  def changeset(guest, attrs) do
    guest
    |> cast(attrs, [:name, :has_special_diet, :diet_notes, :coming, :food_choice])
    |> validate_required([:name, :has_special_diet, :diet_notes, :coming, :food_choice])
  end
end
