alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

# mix phx.gen.schema Invitation invitations lang:string need_transport:boolean max_size:integer size:integer code:string
# mix phx.gen.schema Guest guests name:string has_special_diet:boolean diet_notes:string coming:boolean food_choice:string invitation_id:references:invitations

length = 6



# Utils.gen_code(length)

# Invitations
invite1 = Repo.insert!(%Invitation{ max_size: 2, lang: "EN", code: "qwerty" })
invite2 = Repo.insert!(%Invitation{ max_size: 3, lang: "RS", code: "asdfg" })
invite3 = Repo.insert!(%Invitation{ max_size: 5, lang: "PT", code: "zxcvb" })


# Pre populated guests
Repo.insert!(%Guest{name: "Dylan Kinsella", invitation_id: invite1.id})

Repo.insert!(%Guest{name: "Vesna Maksimović", invitation_id: invite2.id})
Repo.insert!(%Guest{name: "Vaso Maksimović", invitation_id: invite2.id})

Repo.insert!(%Guest{name: "Jorge Ferreira", invitation_id: invite2.id})
Repo.insert!(%Guest{name: "Nela Ferreira", invitation_id: invite2.id})
Repo.insert!(%Guest{name: "Mariana Ferreira", invitation_id: invite2.id})

