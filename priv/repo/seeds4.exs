alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

jovan_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jovan Ilić", invitation_id: jovan_inv.id})
