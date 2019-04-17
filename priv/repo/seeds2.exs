alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

# peach_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

# Repo.insert!(%Guest{name: "Jason Peachey", invitation_id: peach_inv.id})
# Repo.insert!(%Guest{name: "Rebecca Peachey", invitation_id: peach_inv.id})

ricardo_reis_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Ricardo Reis", invitation_id: ricardo_reis_inv.id})
Repo.insert!(%Guest{name: "Rita Reis", invitation_id: ricardo_reis_inv.id})
Repo.insert!(%Guest{name: "Leonor Bacelar", invitation_id: ricardo_reis_inv.id})

aleksa_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Aleksa Andjelkovic", invitation_id: aleksa_inv.id})
