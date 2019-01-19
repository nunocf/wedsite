module Styles exposing (currentSelection, dropdownContainer, dropdownContent, dropdownList, dropdownListItem, dropdownTrigger, hero, ourStory)


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


hero : String
hero =
    [ "hero", "is-fullheight", "has-background-primary" ]
        |> String.join " "


ourStory : String
ourStory =
    [ "hero", "is-fullheight", "has-background-grey" ]
        |> String.join " "
