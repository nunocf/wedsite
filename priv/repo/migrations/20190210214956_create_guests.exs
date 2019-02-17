defmodule Wedsite.Repo.Migrations.CreateGuests do
  use Ecto.Migration

  def change do
    create table(:guests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :diet_type, :string
      add :diet_notes, :string
      add :has_food_allergies, :boolean
      add :food_allergy_notes, :string
      add :food_choice, :string
      add :coming, :boolean
      add :invitation_id, references(:invitations, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:guests, [:invitation_id])
  end
end
