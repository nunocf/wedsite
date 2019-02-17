defmodule Wedsite.Guest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wedsite.Invitation

  @derive {Jason.Encoder, only: [:id, :diet_notes, :coming, :food_choice, :diet_type, :has_food_allergies, :food_allergy_notes, :name]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "guests" do
    field :diet_notes, :string
    field :food_choice, :string
    field :diet_type, :string, null: false
    field :has_food_allergies, :boolean, default: false, null: false
    field :name, :string, null: false
    field :food_allergy_notes, :string
    field :coming, :boolean, default: true, null: false

    belongs_to :invitations, Invitation, foreign_key: :invitation_id

    timestamps()
  end

  @doc false
  def changeset(guest, attrs) do
    guest
    |> cast(attrs, [:name, :diet_notes, :diet_type, :coming, :food_allergy_notes, :food_choice])
    |> validate_required([:name, :has_food_allergies, :coming, :food_choice])
  end
end
