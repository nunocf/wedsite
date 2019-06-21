alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

dordevic_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Sretomir Đorđević", invitation_id: dordevic_inv.id})
Repo.insert!(%Guest{name: "Jasmina Đorđević", invitation_id: dordevic_inv.id})
Repo.insert!(%Guest{name: "Vlada Đorđević", invitation_id: dordevic_inv.id})
Repo.insert!(%Guest{name: "Jelena Đorđević", invitation_id: dordevic_inv.id})

zvekic_inv = Repo.insert!(%Invitation{max_guests: 5, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Željko Zvekić", invitation_id: zvekic_inv.id})
Repo.insert!(%Guest{name: "Danica Zvekić", invitation_id: zvekic_inv.id})
Repo.insert!(%Guest{name: "Boja Zvekić", invitation_id: zvekic_inv.id})
Repo.insert!(%Guest{name: "Ljubica Zvekić", invitation_id: zvekic_inv.id})
Repo.insert!(%Guest{name: "Sava Zvekić", invitation_id: zvekic_inv.id})

popovic_inv = Repo.insert!(%Invitation{max_guests: 5, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Milorad Popović", invitation_id: popovic_inv.id})
Repo.insert!(%Guest{name: "Danilka Zvekić-Popović", invitation_id: popovic_inv.id})
Repo.insert!(%Guest{name: "Dafna Ljubotina", invitation_id: popovic_inv.id})
Repo.insert!(%Guest{name: "Dušan Popović", invitation_id: popovic_inv.id})
Repo.insert!(%Guest{name: "Milan Cvetić", invitation_id: popovic_inv.id})

raseta_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Milan Rašeta", invitation_id: raseta_inv.id})

zdravko_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Zdravko Đurić", invitation_id: zdravko_inv.id})

nesic_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Aleksandar Nešić", invitation_id: nesic_inv.id})
Repo.insert!(%Guest{name: "Lidija Nešić", invitation_id: nesic_inv.id})
Repo.insert!(%Guest{name: "Lenka Nešić", invitation_id: nesic_inv.id})

anna_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Anna", invitation_id: anna_inv.id})
