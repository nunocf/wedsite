module Styles exposing
    ( accomodationGridItem
    , accomodationSection
    , counterFormatting
    , currentSelection
    , dropdownContainer
    , dropdownContent
    , dropdownList
    , dropdownListItem
    , dropdownTrigger
    , formSection
    , headingFormatting
    , hero
    , landingPageHeading
    , landingPageMiddle
    , modalButton
    , ourStory
    , scheduleSection
    , scheduleTimeHeader
    , scheduleTimeSubHeader
    , scheduleTimeSubHeaderFirst
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
    [ ]
        |> String.join " "


scheduleSection : String
scheduleSection =
    [ "hero"
    , "is-fullheight"
    ]
        |> String.join " "


travellingSection : String
travellingSection =
    []
        |> String.join " "


accomodationSection : String
accomodationSection =
    [ "hero"
    , "is-fullheight"
    ]
        |> String.join " "


formSection : String
formSection =
    [ "hero", "is-fullheight", "formBackground" ] |> String.join " "


transportSubtitle : String
transportSubtitle =
    [ "subtitle", "has-text-weight-semi-bold", "is-size-1", "font-amatic" ]
        |> String.join " "


headingFormatting : String
headingFormatting =
    [ "has-text-weight-semibold"
    , "font-heading"
    , "color-heading"
    , "lh1-2"
    ]
        |> String.join " "


landingPageHeading : String
landingPageHeading =
    [ "has-text-weight-semibold"
    , "font-size-landing"
    , "color-heading"
    ]
        |> String.join " "


counterFormatting : String
counterFormatting =
    [ "has-text-weight-semibold"
    , "font-counter-landing"
    , "color-heading"
    ]
        |> String.join " "


landingPageMiddle : String
landingPageMiddle =
    "cw text-justified font-text font-middle-size"


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
    , "single-spaced"
    ]
        |> String.join " "


scheduleTimeSubHeader : String
scheduleTimeSubHeader =
    [ "fira-italic", "mb-1" ]
        |> String.join " "


scheduleTimeSubHeaderFirst : String
scheduleTimeSubHeaderFirst =
    [ "fira-italic", "single-spaced" ]
        |> String.join " "
