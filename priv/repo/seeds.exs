alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

# Oli's pre populated guests

Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

band_inv = Repo.insert!(%Invitation{max_guests: 7, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Marko Luis", invitation_id: band_inv.id})

Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

vesna_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Vaso Maksimović", invitation_id: vesna_inv.id})
Repo.insert!(%Guest{name: "Vesna Maksimović", invitation_id: vesna_inv.id})
Repo.insert!(%Guest{name: "Radmila Đurić", invitation_id: vesna_inv.id})

mima_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Andjelko", invitation_id: mima_inv.id})
Repo.insert!(%Guest{name: "Mima", invitation_id: mima_inv.id})

marija_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Marija Nenadović", invitation_id: marija_inv.id})

anika_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Vuk Kekić", invitation_id: anika_inv.id})
Repo.insert!(%Guest{name: "Anica Kekić", invitation_id: anika_inv.id})
Repo.insert!(%Guest{name: "Jovana Klisura", invitation_id: anika_inv.id})

nathalia_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Nathalia Lara", invitation_id: nathalia_inv.id})
Repo.insert!(%Guest{name: "Thomas Merillac", invitation_id: nathalia_inv.id})

dani_s_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Daniela Sanchez", invitation_id: dani_s_inv.id})

dani_f_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Daniela Franco", invitation_id: dani_f_inv.id})

sanja_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Sanja Ivanović", invitation_id: sanja_inv.id})

veronica_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Veronica Adame Garza", invitation_id: veronica_inv.id})

luisa_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Luisa Restepo la Rota", invitation_id: luisa_inv.id})

jonela_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jonela Ruvina", invitation_id: jonela_inv.id})

claudia_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Claudia Condello", invitation_id: claudia_inv.id})

evan_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Evan Yap", invitation_id: evan_inv.id})

aine_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Aine Ryan", invitation_id: aine_inv.id})

nevena_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Nevena Pavlović", invitation_id: nevena_inv.id})
Repo.insert!(%Guest{name: "Darko Živanović", invitation_id: nevena_inv.id})

dijana_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Dijana Nestorov", invitation_id: dijana_inv.id})

igor_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Igor Jeftić", invitation_id: igor_inv.id})
Repo.insert!(%Guest{name: "Danijela Milošev", invitation_id: igor_inv.id})

mileva_inv = Repo.insert!(%Invitation{max_guests: 5, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Mileva", invitation_id: mileva_inv.id})
Repo.insert!(%Guest{name: "Aleksa", invitation_id: mileva_inv.id})
Repo.insert!(%Guest{name: "Nikola", invitation_id: mileva_inv.id})
Repo.insert!(%Guest{name: "Lenka", invitation_id: mileva_inv.id})
Repo.insert!(%Guest{name: "Marija", invitation_id: mileva_inv.id})

martin_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Martin D'Agostino", invitation_id: martin_inv.id})
Repo.insert!(%Guest{name: "Rebecca D'Agostino", invitation_id: martin_inv.id})
Repo.insert!(%Guest{name: "Lucas D'Agostino", invitation_id: martin_inv.id})
Repo.insert!(%Guest{name: "James D'Agostino", invitation_id: martin_inv.id})

vojica_inv = Repo.insert!(%Invitation{max_guests: 5, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Vojica Šokšić", invitation_id: vojica_inv.id})
Repo.insert!(%Guest{name: "Goca Šokšić", invitation_id: vojica_inv.id})
Repo.insert!(%Guest{name: "Goran Šokšić", invitation_id: vojica_inv.id})
Repo.insert!(%Guest{name: "Mirko Šokšić", invitation_id: vojica_inv.id})
Repo.insert!(%Guest{name: "Milica Šokšić", invitation_id: vojica_inv.id})

jova_inv = Repo.insert!(%Invitation{max_guests: 5, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jova Manojlović", invitation_id: jova_inv.id})
Repo.insert!(%Guest{name: "Biljana Manojlović", invitation_id: jova_inv.id})
Repo.insert!(%Guest{name: "Branislav Manojlović", invitation_id: jova_inv.id})
Repo.insert!(%Guest{name: "Eleonora Manojlović", invitation_id: jova_inv.id})
Repo.insert!(%Guest{name: "Dejan Manojlović", invitation_id: jova_inv.id})

mara_inv = Repo.insert!(%Invitation{max_guests: 6, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Mara Homan", invitation_id: mara_inv.id})
Repo.insert!(%Guest{name: "Lidija Homan-Savković", invitation_id: mara_inv.id})
Repo.insert!(%Guest{name: "Marjan Savković", invitation_id: mara_inv.id})
Repo.insert!(%Guest{name: "Anastazija Savković", invitation_id: mara_inv.id})
Repo.insert!(%Guest{name: "Predrag Kuzmanović", invitation_id: mara_inv.id})
Repo.insert!(%Guest{name: "Slavko Homan", invitation_id: mara_inv.id})

miroslav_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Miroslav Mihajlović", invitation_id: miroslav_inv.id})
Repo.insert!(%Guest{name: "Aleksandra Mihajlović", invitation_id: miroslav_inv.id})
Repo.insert!(%Guest{name: "Jovana Mihajlović", invitation_id: miroslav_inv.id})
Repo.insert!(%Guest{name: "Dimitrije Mihajlović", invitation_id: miroslav_inv.id})

aleksandar_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Saša Dojkov", invitation_id: aleksandar_inv.id})
Repo.insert!(%Guest{name: "Biljana Dojkov", invitation_id: aleksandar_inv.id})
Repo.insert!(%Guest{name: "Melinda Dojkov", invitation_id: aleksandar_inv.id})
Repo.insert!(%Guest{name: "Lazar Milanović", invitation_id: aleksandar_inv.id})

dusko_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Duško Puhalić", invitation_id: dusko_inv.id})
Repo.insert!(%Guest{name: "Marika Puhalić", invitation_id: dusko_inv.id})
Repo.insert!(%Guest{name: "Dragan Puhalić", invitation_id: dusko_inv.id})
Repo.insert!(%Guest{name: "Marta Puhalić", invitation_id: dusko_inv.id})

bogdan_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Bogdan Basta", invitation_id: bogdan_inv.id})

mica_inv = Repo.insert!(%Invitation{max_guests: 7, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Lili", invitation_id: mica_inv.id})

vid_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Vid Surla", invitation_id: vid_inv.id})

radovan_inv = Repo.insert!(%Invitation{max_guests: 7, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Radovan Djuric", invitation_id: radovan_inv.id})

julijana_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Julijana Luco", invitation_id: julijana_inv.id})
Repo.insert!(%Guest{name: "Ljiljana Lukić", invitation_id: julijana_inv.id})
Repo.insert!(%Guest{name: "Vladimir Lukić", invitation_id: julijana_inv.id})
Repo.insert!(%Guest{name: "Olga Tešić", invitation_id: julijana_inv.id})

miodrag_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Miodrag Kerkez", invitation_id: miodrag_inv.id})

jelena_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jelena Bibin", invitation_id: jelena_inv.id})
Repo.insert!(%Guest{name: "Dragoljub Bibin", invitation_id: jelena_inv.id})
Repo.insert!(%Guest{name: "Danilo Bibin", invitation_id: jelena_inv.id})

miroslav_inv = Repo.insert!(%Invitation{max_guests: 6, lang: "RS", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Nadica Bugarski", invitation_id: miroslav_inv.id})

# Nuno's pre populated guests
helena_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Helena Ferreira", invitation_id: helena_inv.id})
Repo.insert!(%Guest{name: "Fernando Ferreira", invitation_id: helena_inv.id})

iva_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Iva Ferreira", invitation_id: iva_inv.id})
Repo.insert!(%Guest{name: "Gory Silva", invitation_id: iva_inv.id})
Repo.insert!(%Guest{name: "Inês Silva", invitation_id: iva_inv.id})

shore_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Shore Costa", invitation_id: shore_inv.id})
Repo.insert!(%Guest{name: "Joana Leal", invitation_id: shore_inv.id})

zeze_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Zezé Ferreira", invitation_id: zeze_inv.id})
Repo.insert!(%Guest{name: "Dulce Almeida", invitation_id: zeze_inv.id})

beatriz_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Beatriz Ferreira", invitation_id: beatriz_inv.id})

zezito_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "José Ferreira", invitation_id: zezito_inv.id})

kevin_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Kevin Carmody", invitation_id: kevin_inv.id})
Repo.insert!(%Guest{name: "Emily Carmody", invitation_id: kevin_inv.id})

bebe_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Bebé Ferreira", invitation_id: bebe_inv.id})
Repo.insert!(%Guest{name: "Miguel Fernandes", invitation_id: bebe_inv.id})

benjamim_inv = Repo.insert!(%Invitation{max_guests: 1, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Benjamim Ferreira", invitation_id: benjamim_inv.id})

jorge_inv = Repo.insert!(%Invitation{max_guests: 3, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jorge Ferreira", invitation_id: jorge_inv.id})
Repo.insert!(%Guest{name: "Nela Ferreira", invitation_id: jorge_inv.id})
Repo.insert!(%Guest{name: "Mariana Ferreira", invitation_id: jorge_inv.id})

catarina_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Catarina Ferreira", invitation_id: catarina_inv.id})
Repo.insert!(%Guest{name: "Eduardo Vieira", invitation_id: catarina_inv.id})

gabriela_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Gabriela Ferreira", invitation_id: gabriela_inv.id})

carla_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Carla Fernandes", invitation_id: carla_inv.id})

patricia_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Patrícia Fernandes", invitation_id: patricia_inv.id})

ricardo_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Ricardo Ferreira", invitation_id: ricardo_inv.id})

joel_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Joel Ferreira", invitation_id: joel_inv.id})

nelson_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Nelson Braga", invitation_id: nelson_inv.id})
Repo.insert!(%Guest{name: "Isabel Silva", invitation_id: nelson_inv.id})

paulo_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Paulo Braga", invitation_id: paulo_inv.id})
Repo.insert!(%Guest{name: "Cris Freitas", invitation_id: paulo_inv.id})

john_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "John Weaver", invitation_id: john_inv.id})

lino_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Lino Santos", invitation_id: lino_inv.id})
Repo.insert!(%Guest{name: "Guida Santos", invitation_id: lino_inv.id})

dylan_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Dylan Kynsella", invitation_id: dylan_inv.id})
Repo.insert!(%Guest{name: "Jancarlo Caling", invitation_id: dylan_inv.id})

josh_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Josh Brough", invitation_id: josh_inv.id})

petrus_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Petrus Matos", invitation_id: petrus_inv.id})

awais_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Awais Ahmad", invitation_id: awais_inv.id})

eurico_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Eurico Silva", invitation_id: eurico_inv.id})
Repo.insert!(%Guest{name: "Luísa Santos", invitation_id: eurico_inv.id})

zu_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Zu Sikora", invitation_id: zu_inv.id})

jas_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Jas Samrai", invitation_id: jas_inv.id})

vikki_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Vikki Neilly", invitation_id: vikki_inv.id})

shemp_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Paul Stevenson", invitation_id: shemp_inv.id})

bish_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Justine Bishop", invitation_id: bish_inv.id})

ian_inv = Repo.insert!(%Invitation{max_guests: 4, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Ian Welton", invitation_id: ian_inv.id})
Repo.insert!(%Guest{name: "Tammy Welton", invitation_id: ian_inv.id})
Repo.insert!(%Guest{name: "Ellie Welton", invitation_id: ian_inv.id})
Repo.insert!(%Guest{name: "Ayden Welton", invitation_id: ian_inv.id})

nic_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Nicola Guiver", invitation_id: nic_inv.id})

gil_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Gil Sequeira", invitation_id: gil_inv.id})

matt_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "EN", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "Matt Thorneycroft", invitation_id: matt_inv.id})

andre_inv = Repo.insert!(%Invitation{max_guests: 2, lang: "PT", code: Utils.randomizer(6)})

Repo.insert!(%Guest{name: "André Lopes", invitation_id: andre_inv.id})
