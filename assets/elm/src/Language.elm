module Language exposing (availableLanguages, langFromFlag, langToString)

import Json.Decode as Decode exposing (Error)
import Translations exposing (Lang)


availableLanguages : List Lang
availableLanguages =
    [ Translations.En, Translations.Pt, Translations.Rs ]


langFromFlag : Result Error String -> Lang
langFromFlag languageFlag =
    case languageFlag of
        Ok language ->
            Translations.getLnFromCode language

        Err _ ->
            Translations.En


langToString : Lang -> String
langToString lang =
    case lang of
        Translations.En ->
            "English"

        Translations.Pt ->
            "Português"

        Translations.Rs ->
            "Srpski"
