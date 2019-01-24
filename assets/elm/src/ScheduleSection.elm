module ScheduleSection exposing (view)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view language =
    div [ class Styles.scheduleSection ]
        [ div [ class "container" ]
            [ div [ class "columns is-centered" ]
                [ div [ class "column is-two-thirds-desktop" ]
                    [ content language
                    ]
                ]
            ]
        ]


content : Lang -> Html msg
content language =
    div [ class "notification" ]
        [ div [ class "columns is-centered" ]
            [ div [ class "column is-three-quarters-desktop" ]
                [ header language
                , schedule language
                ]
            ]
        ]


header : Lang -> Html msg
header language =
    div []
        [ p [ class "title has-text-weight-semibold is-size-1 font-penna" ]
            [ text <| Translations.scheduleTitle language
            ]
        , p [ class "subtitle is-size-5" ]
            [ text <| Translations.scheduleSubtitle language ]
        ]


schedule : Lang -> Html msg
schedule lang =
    div []
        [ scheduleRow Translations.elevenAM [ Translations.elevenAMDesc ] lang
        , scheduleRow Translations.twelveAM [ Translations.twelveAMDesc0, Translations.twelveAMDesc1 ] lang
        , scheduleRow Translations.twoPM [ Translations.twoPMDesc ] lang
        , scheduleRow Translations.fourPM [ Translations.fourPMDesc ] lang
        , scheduleRow Translations.sevenPM [ Translations.sevenPMDesc ] lang
        , scheduleRow Translations.ninePM [ Translations.ninePMDesc ] lang
        , scheduleRow Translations.elevenPM [ Translations.elevenPMDesc ] lang
        ]


scheduleRow : (Lang -> String) -> List (Lang -> String) -> Lang -> Html msg
scheduleRow leftLangFunc rightFunctionList lang =
    let
        rightSideText =
            rightFunctionList
                |> List.map (\f -> f lang)
                |> String.join " "
    in
    div [ class "columns is-centered" ]
        [ div [ class "column" ] [ text <| leftLangFunc lang ]
        , div [ class "column" ] [ text <| rightSideText ]
        ]
