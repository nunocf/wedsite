module Page.Home.Schedule exposing (viewBride, viewChurch, viewGroom, viewHeader, viewVenue)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, height, id, src, type_, width)
import Styles
import Translations


viewHeader : Translations.Lang -> Html msg
viewHeader lang =
    div [ class "has-text-centered" ]
        [ p [ class <| Styles.headingFormatting ++ " mb-4 mt-6" ]
            [ text <| Translations.scheduleTitle lang
            ]
        ]


viewGroom : Translations.Lang -> Html msg
viewGroom lang =
    div [ class "rightMapContainer" ]
        [ div [ class "postLeftContainer" ]
            [ div [ class "st" ]
                [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.elevenAMDesc0 lang ]
                , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.elevenAMDesc1 lang ]
                ]
            , div [ class "boardContainer2 svg-container centerSvg" ]
                [ object [ class "svg-content centerSvg svg75Pct", type_ "image/svg+xml", attribute "data" "svg/post15h.svg" ]
                    [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "textContainerR2" ]
                [ p [ class "font-text is-size-5 text-justified" ] [ text <| Translations.elevenAMDesc2 lang ]
                ]
            ]
        , div [ id "groomMap" ] []
        ]


viewBride : Translations.Lang -> Html msg
viewBride lang =
    div [ class "leftMapContainer" ]
        [ div [ id "brideMap" ] []
        , div [ class "postRightContainer" ]
            [ div [ class "st" ]
                [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.twelveAMDesc0 lang ]
                , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twelveAMDesc1 lang ]
                ]
            , div [ class "textContainerL2" ]
                [ p [ class "font-text is-size-5 text-justified" ] [ text <| Translations.twelveAMDesc2 lang ]
                ]
            , div [ class "boardContainer2 svg-container centerSvg" ]
                [ object [ class "svg-content centerSvg svg75Pct", type_ "image/svg+xml", attribute "data" "svg/post15h.svg" ]
                    [ text "Your browser does not support SVGs" ]
                ]
            ]
        ]


viewChurch : Translations.Lang -> Html msg
viewChurch lang =
    div [ class "rightMapContainer" ]
        [ div [ class "postLeftContainer" ]
            [ div [ class "st" ]
                [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.twoPMDesc0 lang ]
                , p [ class Styles.scheduleTimeSubHeaderFirst ] [ text <| Translations.twoPMDesc1 lang ++ ", " ]
                , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twoPMDesc2 lang ]
                ]
            , div [ class "boardContainer2 svg-container centerSvg" ]
                [ object [ class "svg-content centerSvg svg75Pct", type_ "image/svg+xml", attribute "data" "svg/post15h.svg" ]
                    [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "textContainerR2" ]
                [ p [ class "font-text is-size-5 text-justified" ] [ text <| Translations.twoPMDesc3 lang ]
                ]
            ]
        , div [ id "churchMap" ] []
        ]


viewVenue : Translations.Lang -> Html msg
viewVenue lang =
    div [ class "leftMapContainer" ]
        [ div [ id "restaurantMap" ] []
        , div [ class "postRightContainer" ]
            [ div [ class "st" ]
                [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.fourPMDesc0 lang ]
                , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.fourPMDesc1 lang ]
                ]
            , div [ class "textContainerL2" ]
                [ p [ class "font-text is-size-5 text-justified" ] [ text <| Translations.fourPMDesc2 lang ]
                ]
            , div [ class "boardContainer2 svg-container centerSvg" ]
                [ object [ class "svg-content centerSvg svg75Pct", type_ "image/svg+xml", attribute "data" "svg/post15h.svg" ]
                    [ text "Your browser does not support SVGs" ]
                ]
            ]
        ]
