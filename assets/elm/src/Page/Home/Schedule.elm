module Page.Home.Schedule exposing (viewBride, viewChurch, viewGroom, viewHeader, viewVenue)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, height, id, src, type_, width)
import Styles
import Translations


viewHeader : Translations.Lang -> Html msg
viewHeader lang =
    div [ class "has-text-centered" ]
        [ p [ class Styles.headingFormatting ]
            [ text <| Translations.scheduleTitle lang
            ]
        , p [ class "subtitle is-size-5" ]
            [ text <| Translations.scheduleSubtitle lang ]
        ]


viewGroom : Translations.Lang -> Html msg
viewGroom lang =
    div [ class "rightMapContainer" ]
        [ div [ class "boardContainer" ]
            [  div [class "svg-container"] [
                object [ type_ "image/svg+xml", attribute "data" "images/postone.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
            ]
            
        , div [ class "textContainer" ]
            [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.elevenAMDesc0 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.elevenAMDesc1 lang ]
            ]
        , div [ id "groomMap" ] []
        ]


viewBride : Translations.Lang -> Html msg
viewBride lang =
    div [ class "leftMapContainer" ]
        [ div [ id "brideMap" ] []
        , div [ class "textContainer" ]
            [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.twelveAMDesc0 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twelveAMDesc1 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twelveAMDesc2 lang ]
            ]
        , div [ class "boardContainer" ]
            [ div [] [ img [ src "https://via.placeholder.com/200x240" ] [] ]
            , div [] []
            ]
        ]


viewChurch : Translations.Lang -> Html msg
viewChurch lang =
    div [ class "rightMapContainer" ]
        [ div [ class "boardContainer" ]
            [ div [] [ img [ src "https://via.placeholder.com/200x240" ] [] ]
            , div [] []
            ]
        , div [ class "textContainer" ]
            [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.twoPMDesc0 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twoPMDesc1 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twoPMDesc2 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.twoPMDesc3 lang ]
            ]
        , div [ id "churchMap" ] []
        ]


viewVenue : Translations.Lang -> Html msg
viewVenue lang =
    div [ class "leftMapContainer" ]
        [ div [ id "restaurantMap" ] []
        , div [ class "textContainer" ]
            [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.fourPMDesc0 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.fourPMDesc1 lang ]
            , p [ class Styles.scheduleTimeSubHeader ] [ text <| Translations.fourPMDesc2 lang ]
            ]
        , div [ class "boardContainer" ]
            [ div [] [ img [ src "https://via.placeholder.com/200x240" ] [] ]
            , div [] []
            ]
        ]
