port module Cmd exposing (storeLanguage)

import Language exposing (getCodeFromLn)
import Translations exposing (Lang)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> getCodeFromLn
        |> storeLanguageInLocalStorage
