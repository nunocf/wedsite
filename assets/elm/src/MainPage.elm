module MainPage exposing (view)

import AccomodationSection
import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import LanguageDropdown
import Msg exposing (Msg)
import OurStorySection
import RSVPSection
import ScheduleSection
import Styles
import Translations exposing (Lang)
import TravellingSection


view : Lang -> Bool -> Bool -> List (Html Msg)
view currentLanguage showAvailableLanguages showFullPoem =
    [ hero currentLanguage showAvailableLanguages
    , OurStorySection.view currentLanguage showFullPoem
    , ScheduleSection.view currentLanguage
    , TravellingSection.view currentLanguage
    , AccomodationSection.view currentLanguage
    , RSVPSection.view currentLanguage
    ]


hero : Lang -> Bool -> Html Msg
hero currentLanguage showAvailableLanguages =
    section [ class Styles.hero ]
        [ heroHead currentLanguage showAvailableLanguages
        , heroBody
        , heroFoot
        ]


heroHead : Lang -> Bool -> Html Msg
heroHead currentLanguage showAvailableLanguages =
    div [ class "hero-head" ]
        [ div [ class "navbar has-background-white columns is-mobile is-marginless heading text-weight-bold" ]
            [ div [ class "column left" ]
                [ p [ class "navbar-item has-text-black" ] [ text "LOGO?" ] ]
            , div [ class "column right" ]
                [ LanguageDropdown.view currentLanguage showAvailableLanguages
                ]
            ]
        ]


heroBody : Html Msg
heroBody =
    div [ class "hero-body" ]
        [ div [ class "is-overlay has-text-centered single-spaced", style "top" "84px" ]
            [ h1 [ class "subtitle is-4 has-text-weight-light has-text-black" ] [ text "We're doing it!" ]
            , h2 [ class "title is-1 has-text-black" ] [ text "7 September 2019" ]
            ]
        ]


heroFoot : Html Msg
heroFoot =
    div [ class "hero-foot center", style "padding" "2rem" ]
        [ div [ id "grid", style "width" "768px" ]
            [ div [ id "a", class "center-column" ]
                [ p [ class "has-text-centered has-text-white is-size-5" ]
                    [ text ""
                    ]
                ]
            , div [ id "c", class "center-column" ]
                [ a [ class "has-text-centered has-text-white is-size-5" ]
                    [ text ""
                    ]
                ]
            , div [ id "d", class "center-column" ]
                [ a
                    [ class "button is-danger is-inverted is-rounded is-outlined has-text-weight-bold"
                    , style "width" "100%"
                    , style "border" "0.15em solid white"
                    ]
                    [ text "RSVP" ]
                ]
            ]
        ]
