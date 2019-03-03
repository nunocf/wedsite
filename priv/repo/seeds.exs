alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

length = 6



# Utils.gen_code(length)

# Invitations
invite1 = Repo.insert!(%Invitation{ max_guests: 2, lang: "EN", code: "qwerty" })
invite2 = Repo.insert!(%Invitation{ max_guests: 3, lang: "RS", code: "maksim" })
invite3 = Repo.insert!(%Invitation{ max_guests: 5, lang: "PT", code: "zxcvb" })
invite4 = Repo.insert!(%Invitation{ max_guests: 2, lang: "PT", code: "ferrei"})

# Pre populated guests
Repo.insert!(%Guest{name: "Dylan Kinsella", invitation_id: invite1.id})

Repo.insert!(%Guest{name: "Vaso Maksimović", invitation_id: invite2.id})
Repo.insert!(%Guest{name: "Vesna Maksimović", invitation_id: invite2.id})

Repo.insert!(%Guest{name: "Mariana Ferreira", invitation_id: invite3.id})
Repo.insert!(%Guest{name: "Nela Ferreira", invitation_id: invite3.id})
Repo.insert!(%Guest{name: "Jorge Ferreira", invitation_id: invite3.id})

Repo.insert!(%Guest{name: "Fernando Ferreira", invitation_id: invite4.id})
Repo.insert!(%Guest{name: "Helena Ferreira", invitation_id: invite4.id})
