module Session exposing (Session, lang, navKey, setLanguage, setShowLanguages, showLanguages)

import Browser.Navigation as Nav
import Translations



-- TYPES


type alias Session =
    { language : Translations.Lang
    , showLanguages : Bool
    , key : Nav.Key
    }


navKey : Session -> Nav.Key
navKey session =
    session.key


lang : Session -> Translations.Lang
lang session =
    session.language


showLanguages : Session -> Bool
showLanguages session =
    session.showLanguages


setLanguage : Session -> Translations.Lang -> Session
setLanguage session language =
    { session | language = language }


setShowLanguages : Session -> Bool -> Session
setShowLanguages session show =
    { session | showLanguages = show }
