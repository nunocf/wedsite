module Styles exposing
    ( accomodationSection
    , currentSelection
    , dropdownContainer
    , dropdownContent
    , dropdownList
    , dropdownListItem
    , dropdownTrigger
    , headingFormatting
    , hero
    , ourStory
    , rsvpSection
    , scheduleSection
    , scheduleTimeHeader
    , scheduleTimeSubHeader
    , textFont
    , transportSubtitle
    , travellingSection
    )


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
dropdownList showLanguages =
    let
        displayClasses =
            if showLanguages then
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
    [ "hero", "is-fullheight", "has-background-info" ]
        |> String.join " "


ourStory : String
ourStory =
    [ "hero", "is-fullheight", "background" ]
        |> String.join " "


scheduleSection : String
scheduleSection =
    [ "hero", "is-fullheight", "has-background-primary" ]
        |> String.join " "


travellingSection : String
travellingSection =
    [ "hero", "is-fullheight", "has-background-info" ]
        |> String.join " "


accomodationSection : String
accomodationSection =
    [ "hero", "is-fullheight", "background" ] |> String.join " "


transportSubtitle : String
transportSubtitle =
    [ "subtitle", "has-text-weight-semi-bold", "is-size-2", "font-heading" ]
        |> String.join " "


rsvpSection : String
rsvpSection =
    [ "hero", "is-fullheight", "has-background-primary" ]
        |> String.join " "


headingFormatting : String
headingFormatting =
    [ "title"
    , "has-text-weight-semibold"
    , "font-heading"
    , "color-heading"
    ]
        |> String.join " "


textFont : String
textFont =
    [ "font-text"
    , "font-text-size"
    , "font-text-align"
    , "poemTextColor"
    , "textShadow"
    ]
        |> String.join " "


scheduleTimeHeader : String
scheduleTimeHeader =
    [ "font-amatic"
    , "amatic-subheader-size"
    ]
        |> String.join " "


scheduleTimeSubHeader : String
scheduleTimeSubHeader =
    [ "fira-italic" ]
        |> String.join " "
