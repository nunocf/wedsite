defmodule Wedsite.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :accepted, :boolean, default: false, null: false
      add :lang, :string, default: "EN"
      add :max_guests, :integer, default: 2
      add :guest_count, :integer, default: 0
      add :children_count, :integer, default: 0
      add :code, :string, null: false

      timestamps()
    end

  end
end
