module Translations exposing
    ( Lang(..)
    , getCodeFromLn
    , getLnFromCode
    , title
    , verticallyCenteringInCssIsEasy
    )


type Lang
    = En
    | Pt
    | Rs


getLnFromCode : String -> Lang
getLnFromCode code =
    case code of
        "en" ->
            En

        "pt" ->
            Pt

        "rs" ->
            Rs

        _ ->
            En


getCodeFromLn : Lang -> String
getCodeFromLn code =
    case code of
        En ->
            "en"

        Pt ->
            "pt"

        Rs ->
            "rs"


title : Lang -> String
title lang =
    case lang of
        En ->
            "Nuno & Oli's Wedsite"

        Pt ->
            "Titulo em Português"

        Rs ->
            "Srbski Title"


verticallyCenteringInCssIsEasy : Lang -> String
verticallyCenteringInCssIsEasy lang =
    case lang of
        En ->
            "Vertically centering things in css is easy!"

        Pt ->
            "Centrar elementos verticalmente em CSS é fácil!"

        Rs ->
            "Kaffa sa žirafom!"
