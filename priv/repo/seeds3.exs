alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

peach_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jason Peachey", invitation_id: peach_inv.id})
Repo.insert!(%Guest{name: "Rebecca Peachey", invitation_id: peach_inv.id})
Repo.insert!(%Guest{name: "Chace", invitation_id: peach_inv.id})
Repo.insert!(%Guest{name: "Alyssa", invitation_id: peach_inv.id})
