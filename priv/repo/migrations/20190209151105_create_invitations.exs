defmodule Wedsite.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :lang, :string
      add :max_size, :integer
      add :size, :integer
      add :code, :string
      add :need_transport, :boolean, default: false, null: false

      timestamps()
    end

  end
end
