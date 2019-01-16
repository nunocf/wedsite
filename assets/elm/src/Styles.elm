module Styles exposing (currentSelection, dropdownContainer, dropdownContent, dropdownList, dropdownListItem, dropdownTrigger, header, main_, nav, navLink, subtitle, title)


currentSelection : String
currentSelection =
    "button is-uppercase heading"


dropdownContainer : String
dropdownContainer =
    [ "dropdown"
    , "is-right"
    , "is-active"
    , "is-fullwidth"
    ]
        |> String.join " "


dropdownTrigger : String
dropdownTrigger =
    "dropdown-trigger"


dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                []

            else
                [ "dn" ]
    in
    [ "dropdown-menu"
    ]
        ++ displayClasses
        |> String.join " "


dropdownContent : String
dropdownContent =
    "dropdown-content"


dropdownListItem : String
dropdownListItem =
    "dropdown-item"


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
