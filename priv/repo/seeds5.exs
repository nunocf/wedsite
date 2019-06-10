alias Wedsite.Invitation
alias Wedsite.Guest
alias Wedsite.Repo
alias Wedsite.Utils

Repo.insert!(%Invitation{max_guests: 20, lang: "EN", code: Utils.randomizer(6)})
