defmodule Wedsite.Repo.Migrations.CreateGuests do
  use Ecto.Migration

  def change do
    create table(:guests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :has_special_diet, :boolean, default: false, null: false
      add :diet_notes, :string
      add :coming, :boolean, default: false, null: false
      add :food_choice, :string
      add :invitation_id, references(:invitations, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:guests, [:invitation_id])
  end
end
