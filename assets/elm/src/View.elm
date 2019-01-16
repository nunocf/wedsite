module View exposing (view)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import LanguageDropdown
import Model exposing (Model)
import Msg exposing (Msg)
import Styles
import Translations exposing (Lang)



-- view : Model -> Document Msg
-- view model =
--     { title = model.title
--     , body =
--         [ main_ [ class Styles.main_, onClick Msg.CloseAvailableLanguages ]
--             [ hero model
--             , content model.currentLanguage
--             ]
--         ]
--     }


view : Model -> Document Msg
view model =
    { title = model.title
    , body =
        [ main_ []
            [ hero model
            ]
        ]
    }



-- hero : Model -> Html Msg
-- hero model =
--     header [ class Styles.header ]
--         [ h1 [ class Styles.title ] [ text "Titleaa" ]
--         , h2 [ class Styles.subtitle ] [ text "Subtitle" ]
--         , LanguageDropdown.view model
--         , dropdownTest
--         , nav [ class Styles.nav ]
--             [ a [ class Styles.navLink ]
--                 [ text "Our Story" ]
--             , a
--                 [ class Styles.navLink ]
--                 [ text "Schedule" ]
--             ]
--         ]


hero : Model -> Html Msg
hero model =
    section [ class "hero is-fullheight has-background-primary" ]
        [ heroHead model
        , heroBody model
        , heroFoot model
        ]


heroHead : Model -> Html Msg
heroHead model =
    div [ class "hero-head" ]
        [ div [ class "columns is-mobile is-marginless heading text-weight-bold" ]
            [ div [ class "column left" ]
                [ p [ class "navbar-item has-text-black" ] [ text "LOGO?" ] ]
            , div [ class "column center desktop" ]
                [ p [ class "navbar-item has-text-black" ] [ text "Our Story" ]
                , p [ class "navbar-item has-text-black" ] [ text "Location" ]
                , p [ class "navbar-item has-text-black" ] [ text "Schedule" ]
                ]
            , div [ class "column right level" ]
                [ LanguageDropdown.view2 model
                , figure [ class "navbar-item image has-text-black center" ]
                    [ i
                        [ class " fas fa-bars fa-lg"
                        , style "vertical-align" "center"
                        ]
                        []
                    ]
                ]
            ]
        ]


heroBody : Model -> Html Msg
heroBody model =
    div [ class "hero-body" ]
        [ div [ class "is-overlay has-text-centered single-spaced", style "top" "84px" ]
            [ h1 [ class "subtitle is-4 has-text-weight-light has-text-black" ] [ text "We're doing it!" ]
            , h2 [ class "title is-1 has-text-black" ] [ text "7 September 2019" ]
            ]
        ]


heroFoot : Model -> Html Msg
heroFoot model =
    div [ class "hero-foot center", style "padding" "2rem" ]
        [ div [ id "grid", style "width" "768px" ]
            [ div [ id "a", class "center-column" ]
                [ p [ class "has-text-centered has-text-white is-size-5" ]
                    [ text "English"
                    ]
                ]
            , div [ id "b", class "center-column" ]
                [ p [ class "has-text-centered has-text-white is-size-5" ]
                    [ text "Português"
                    ]
                ]
            , div [ id "c", class "center-column" ]
                [ a [ class "has-text-centered has-text-white is-size-5" ]
                    [ text "Srpski"
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


dropdownTest : Html Msg
dropdownTest =
    div [ class "dropdown is-right is-active" ]
        [ div [ class "dropdown-trigger" ]
            [ button [ class "button" ]
                [ span [] [ text " I'm a dropdown" ]
                , span [ class "icon is-small" ]
                    [ i [ class "fas fa-angle-down" ] []
                    ]
                ]
            ]
        , div [ class "dropdown-menu", id "dropdown-menu" ]
            [ div [ class "dropdown-content" ]
                [ p [ class "dropdown-item" ] [ text "first item?" ]
                ]
            ]
        ]


content : Lang -> Html Msg
content language =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading language ]
        ]


heading : Lang -> Html Msg
heading language =
    h1 [ class Styles.heading ]
        [ text (Translations.verticallyCenteringInCssIsEasy language) ]
