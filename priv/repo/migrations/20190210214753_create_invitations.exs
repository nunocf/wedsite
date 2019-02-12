defmodule Wedsite.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :lang, :string
      add :need_transport, :boolean, default: false, null: false
      add :max_size, :integer
      add :size, :integer
      add :code, :string

      timestamps()
    end

  end
end
