defmodule Wedsite.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :accepted, :boolean
      add :lang, :string, default: "EN"
      add :max_guests, :integer, default: 2
      add :guest_count, :integer, default: 0
      add :children_count, :integer, default: 0
      add :code, :string, null: false
      add :email, :string

      timestamps(usec: true)
    end

  end
end
