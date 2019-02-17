module Language exposing (availableLanguages, getCodeFromLn, langDecoder, langEncoder, langFromFlag, langToString)

import Json.Decode as Decode exposing (Error)
import Json.Encode as Encode
import Translations exposing (Lang)


getCodeFromLn : Lang -> String
getCodeFromLn lang =
    case lang of
        Translations.En ->
            "en"

        Translations.Pt ->
            "pt"

        Translations.Rs ->
            "rs"


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


langDecoder : Decode.Decoder Lang
langDecoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "EN" ->
                        Decode.succeed Translations.En

                    "PT" ->
                        Decode.succeed Translations.Pt

                    "RS" ->
                        Decode.succeed Translations.Rs

                    _ ->
                        Decode.succeed Translations.En
            )


langEncoder : Lang -> Encode.Value
langEncoder lang =
    case lang of
        Translations.En ->
            Encode.string "EN"

        Translations.Pt ->
            Encode.string "PT"

        Translations.Rs ->
            Encode.string "RS"
