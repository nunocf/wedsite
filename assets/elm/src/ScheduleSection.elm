module ScheduleSection exposing (view)

import Html exposing (Html, div, img, p, text)
import Html.Attributes exposing (class, src)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view language =
    div [ class Styles.scheduleSection ]
        [ div [ class "container" ]
            [ header language
            , div [ class "scheduleContainer" ]
                (groomMeet language)
            ]

        -- [ div [ class "columns is-centered" ]
        --     [ div [ class "column is-two-thirds-desktop" ]
        --         [ content language
        --         ]
        --     ]
        -- ]
        ]


groomMeet : Lang -> List (Html msg)
groomMeet lang =
    [ div [ class "board-wrapper" ]
        [ img [ src "https://via.placeholder.com/200x240" ] [] ]
    , div []
        [ p [ class Styles.scheduleTimeHeader ] [ text <| Translations.elevenAMDesc0 lang ]
        , p [ class Styles.scheduleTimeSubHeader] [ text <| Translations.elevenAMDesc1 lang ]
        ]
    , div [] [ text "I HAVE A MAP" ]
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
    div [ class "has-text-centered" ]
        [ p [ class Styles.headingFormatting ]
            [ text <| Translations.scheduleTitle language
            ]
        , p [ class "subtitle is-size-5" ]
            [ text <| Translations.scheduleSubtitle language ]
        ]


schedule : Lang -> Html msg
schedule lang =
    div []
        [ scheduleRow Translations.elevenAM
            [ Translations.elevenAMDesc0
            , Translations.elevenAMDesc1
            , Translations.elevenAMDesc2
            ]
            lang
        , scheduleRow Translations.twelveAM
            [ Translations.twelveAMDesc0
            , Translations.twelveAMDesc1
            ]
            lang
        , scheduleRow Translations.twoPM
            [ Translations.twoPMDesc0
            , Translations.twoPMDesc1
            , Translations.twoPMDesc2
            , Translations.twoPMDesc3
            ]
            lang
        , scheduleRow Translations.fourPM
            [ Translations.fourPMDesc0
            , Translations.fourPMDesc1
            , Translations.fourPMDesc2
            ]
            lang
        , scheduleRow Translations.sevenPM
            [ Translations.sevenPMDesc0
            , Translations.sevenPMDesc1
            ]
            lang
        , scheduleRow Translations.ninePM
            [ Translations.ninePMDesc0
            , Translations.ninePMDesc1
            ]
            lang
        , scheduleRow Translations.elevenPM
            [ Translations.elevenPMDesc0
            , Translations.elevenPMDesc1
            ]
            lang
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
