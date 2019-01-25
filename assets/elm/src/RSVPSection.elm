module RSVPSection exposing (view)

import Html exposing (Html, a, div, p, text)
import Html.Attributes exposing (class)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view lang =
    div [ class Styles.rsvpSection ]
        [ div [ class "container" ]
            [ div [ class "columns is-centered" ]
                [ div [ class "column is-two-thirds-desktop" ]
                    [ content lang
                    ]
                ]
            ]
        ]


content : Lang -> Html msg
content lang =
    div [ class "notification" ]
        [ div [ class "columns is-centered" ]
            [ div [ class "column is-three-quarters-desktop" ]
                [ header lang
                , rsvpText lang
                ]
            ]
        ]


header : Lang -> Html msg
header lang =
    div []
        [ p [ class "title has-text-weight-semi-bold is-size-1 font-penna" ]
            [ text <| Translations.rsvpTitle lang
            ]
        ]


rsvpText : Lang -> Html msg
rsvpText lang =
    div []
        [ p []
            [ text <|
                Translations.rsvp0 lang
                    ++ Translations.rsvp1 lang
                    ++ Translations.rsvp2 lang
            ]
        ]
