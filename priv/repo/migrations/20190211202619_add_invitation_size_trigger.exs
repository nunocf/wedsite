defmodule Wedsite.Repo.Migrations.AddInvitationSizeTrigger do
  use Ecto.Migration

  def up do
    execute """
    CREATE OR REPLACE FUNCTION update_invitation_guest_count()
    RETURNS trigger AS $$
    BEGIN
      IF (TG_OP = 'INSERT') THEN
        UPDATE invitations SET guest_count = guest_count + 1
          WHERE id = NEW.invitation_id;
        RETURN NEW;
      ELSIF (TG_OP = 'DELETE') THEN
        UPDATE invitations SET guest_count = guest_count - 1
          WHERE id = OLD.invitation_id;
        RETURN OLD;
      END IF;
      RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;
    """
    execute "DROP TRIGGER IF EXISTS update_invitation_guest_count_trg ON guests;"
    execute """
    CREATE TRIGGER update_invitation_guest_count_trg
    AFTER INSERT OR DELETE
    ON guests
    FOR EACH ROW
    EXECUTE PROCEDURE update_invitation_guest_count();
    """
  end

  def down do
    execute "DROP FUNCTION update_invitation_size_count() CASCADE;"

  end
end
