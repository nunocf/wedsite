module NavBar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, type_)
import Html.Events as Events
import Json.Decode as Decode
import Language
import Page exposing (Page(..))
import Route exposing (Route)
import Session exposing (Session)
import Styles
import Translations
import Types exposing (Msg(..))


view : Session -> Page -> Html Msg
view session page =
    let
        linkTo =
            navbarLink page

        lang =
            Session.lang session
    in
    div [ class "navContainer navbar is-marginless heading" ]
        [ div [ class "linksContainer" ]
            [ div [ class "smallFlower svgCentered svg-container height-4" ]
                [ object [ class "svg30Pct svg-content di", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , linkTo Route.Home [ text <| Translations.home lang ] "home"
            , linkTo Route.Code [ text <| Translations.rsvp lang ] "code"
            , div [ class "smallFlower2 svgCentered svg-container height-4" ]
                [ object [ class "svg30Pct svg-content di", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            ]
        , div [ class "langContainer" ]
            [ viewLanguageDropdown (Session.lang session) (Session.showLanguages session)
            ]
        ]


navbarLink : Page -> Route -> List (Html msg) -> String -> Html msg
navbarLink page route linkContent extraClass =
    let
        active =
            isActive page route
    in
    div
        [ classList
            [
             ( "active", active )
            , ( "is-size-2", True )
            , ( "font-amatic", True )
            , ( "font-heavy", True )
            , ( extraClass, True )
            ]
        ]
        [ a [ classList [ ( "active", active ) ], Route.href route ] linkContent ]


isActive : Page -> Route -> Bool
isActive page route =
    case ( page, route ) of
        ( Home, Route.Home ) ->
            True

        ( Code, Route.Code ) ->
            True

        ( Coming, Route.Code ) ->
            True

        ( Complete, Route.Code ) ->
            True

        ( GuestDetails, Route.Code ) ->
            True

        _ ->
            False


viewLanguageDropdown : Translations.Lang -> Bool -> Html Msg
viewLanguageDropdown currentLanguage showLanguages =
    let
        selectableLanguages =
            List.filter
                (\language -> language /= currentLanguage)
                Language.availableLanguages
    in
    div [ class Styles.dropdownContainer ]
        [ currentSelection currentLanguage
        , dropdownList showLanguages selectableLanguages
        ]


currentSelection : Translations.Lang -> Html Msg
currentSelection currentLanguage =
    div [ class Styles.dropdownTrigger ]
        [ button
            [ class Styles.currentSelection
            , Events.custom "click"
                (Decode.succeed
                    { message = ShowLanguages
                    , stopPropagation = True
                    , preventDefault = False
                    }
                )
            ]
            [ span
                []
                [ text (Language.langToString currentLanguage) ]
            , span [ class "icon is-small" ]
                [ i [ class "fas fa-angle-down" ] []
                ]
            ]
        ]


dropdownList : Bool -> List Translations.Lang -> Html Msg
dropdownList showLanguages selectableLanguages =
    div [ class (Styles.dropdownList showLanguages), id "dropdownList" ]
        [ div [ class Styles.dropdownContent ]
            (List.map dropdownListItem selectableLanguages)
        ]


dropdownListItem : Translations.Lang -> Html Msg
dropdownListItem language =
    div [ class Styles.dropdownListItem, Events.onClick <| ChangeLanguage language ]
        [ text (Language.langToString language) ]
