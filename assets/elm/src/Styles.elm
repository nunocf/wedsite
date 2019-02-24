module Styles exposing
    ( accomodationGridItem
    , accomodationSection
    , currentSelection
    , dropdownContainer
    , dropdownContent
    , dropdownList
    , dropdownListItem
    , dropdownTrigger
    , formSection
    , headingFormatting
    , hero
    , landingPageMiddle
    , modalButton
    , ourStory
    , rsvpSection
    , scheduleSection
    , scheduleTimeHeader
    , scheduleTimeSubHeader
    , textFont
    , transportSubtitle
    , travelMenuItem
    , travelMenuItemLast
    , travellingSection
    )


travelMenuItem : String
travelMenuItem =
    "travelMenuItem font-amatic is-size-3 font-heavy"


travelMenuItemLast : String
travelMenuItemLast =
    "travelMenuItemLast font-amatic is-size-3 font-heavy"


modalButton : String
modalButton =
    "modalButton slightlyLessMovable font-text is-size-5"


accomodationGridItem : String
accomodationGridItem =
    "pointerCursor movable roundCorners boxShadow"


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
    [ "hero", "is-fullheight", "backgroundLanding", "landingContainer" ]
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
    [ "background" ]
        |> String.join " "


accomodationSection : String
accomodationSection =
    [ "hero", "is-fullheight", "background" ] |> String.join " "


formSection : String
formSection =
    [ "hero", "is-fullheight", "background" ] |> String.join " "


transportSubtitle : String
transportSubtitle =
    [ "subtitle", "has-text-weight-semi-bold", "is-size-1", "font-amatic" ]
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


landingPageMiddle : String
landingPageMiddle =
    "title cw text-justified font-text"


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
