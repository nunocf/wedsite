defmodule Wedsite.Repo.Migrations.CreateGuests do
  use Ecto.Migration

  def change do
    create table(:guests) do
      add :name, :string
      add :diet_type, :string
      add :diet_notes, :string
      add :has_food_allergies, :boolean
      add :food_allergy_notes, :string
      add :food_choice, :string
      add :coming, :boolean
      add :invitation_id, references(:invitations, on_delete: :nothing)

      timestamps(usec: true)
    end

    create index(:guests, [:invitation_id])
  end
end

