module Styles exposing
    ( article
    , articleContainer
    , caret
    , currentSelection
    , dropdownContainer
    , dropdownList
    , dropdownListItem
    , header
    , heading
    , main_
    , nav
    , navLink
    , subtitle
    , title
    )


article : String
article =
    [ "dt"
    , "vh-75"
    , "w-100"
    ]
        |> String.join " "


articleContainer : String
articleContainer =
    [ "dtc"
    , "ph3 ph4-l"
    , "tc"
    , "v-mid"
    ]
        |> String.join " "


caret : String
caret =
    [ "absolute"
    , "ml2"
    ]
        |> String.join " "


currentSelection : Bool -> String
currentSelection showAvailableLanguages =
    let
        availableLanguagesClasses =
            if showAvailableLanguages then
                [ "br--top" ]

            else
                []
    in
    [ "b--white"
    , "ba"
    , "br2"
    , "pa2"
    , "pointer"
    , "tc"
    , "w5"
    ]
        ++ availableLanguagesClasses
        |> String.join " "


dropdownContainer : String
dropdownContainer =
    [ "center"
    , "f3"
    , "flex"
    , "h3"
    , "items-center"
    , "justify-end"
    , "w-90"
    ]
        |> String.join " "


dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                [ "flex", "flex-column" ]

            else
                [ "dn" ]
    in
    [ "absolute"
    , "b--white"
    , "bb"
    , "bl"
    , "br"
    , "br--bottom"
    , "br2"
    , "items-center"
    , "list"
    , "mt5"
    , "pl0"
    , "pointer"
    , "pr0"
    , "pt1"
    , "tc"
    , "top-0"
    , "w5"
    ]
        ++ displayClasses
        |> String.join " "


dropdownListItem : String
dropdownListItem =
    [ "hover-bg-white"
    , "hover-dark-pink"
    , "ph1"
    , "pv2"
    , "pt0"
    , "w-100"
    ]
        |> String.join " "


heading : String
heading =
    [ "f6 f2m"
    , "f-subheadline-l"
    , "fw6"
    , "tc"
    ]
        |> String.join " "


main_ : String
main_ =
    [ "bg-dark-pink"
    , "pt3"
    , "overflow-container"
    , "sans-serif"
    , "vh-100"
    , "white"
    ]
        |> String.join " "


header : String
header =
    [ "bg-white"
    , "black-80"
    , "tc"
    , "pv4"
    , "avenir"
    ]
        |> String.join " "


nav : String
nav =
    [ "bt"
    , "bb"
    , "tc"
    , "mw7"
    , "center"
    , "mt4"
    ]
        |> String.join " "


navLink : String
navLink =
    [ "f6"
    , "f5-l"
    , "link"
    , "bg-animate"
    , "black-80"
    , "hover-bg-lightest-blue"
    , "dib"
    , "pa3"
    , "ph4-l"
    ]
        |> String.join " "


title : String
title =
    [ "mt2"
    , "mb0"
    , "baskerville"
    , "i"
    , "fw1"
    , "f1"
    ]
        |> String.join " "


subtitle : String
subtitle =
    [ "mt2"
    , "mb0"
    , "f6"
    , "fw4"
    , "ttu"
    , "tracked"
    ]
        |> String.join " "
