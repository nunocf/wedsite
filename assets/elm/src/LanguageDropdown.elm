module LanguageDropdown exposing (view)

import Html exposing (Html, a, button, div, i, li, p, span, text, ul)
import Html.Attributes exposing (class, id, style)
import Html.Events as Events exposing (onClick)
import Json.Decode as Decode
import Language
import Msg exposing (Msg)
import Styles
import Translations exposing (Lang)


view : Lang -> Bool -> Html Msg
view currentLanguage showAvailableLanguages =
    let
        selectableLanguages =
            List.filter
                (\language -> language /= currentLanguage)
                Language.availableLanguages
    in
    div [ class Styles.dropdownContainer ]
        [ currentSelection currentLanguage
        , dropdownList showAvailableLanguages selectableLanguages
        ]


currentSelection : Lang -> Html Msg
currentSelection currentLanguage =
    div [ class Styles.dropdownTrigger ]
        [ button
            [ class Styles.currentSelection
            , Events.custom "click"
                (Decode.succeed
                    { message = Msg.ShowAvailableLanguages
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


dropdownList : Bool -> List Lang -> Html Msg
dropdownList showAvailableLanguages selectableLanguages =
    div [ class (Styles.dropdownList showAvailableLanguages), id "dropdownList" ]
        [ div [ class Styles.dropdownContent ]
            (List.map dropdownListItem selectableLanguages)
        ]


dropdownListItem : Lang -> Html Msg
dropdownListItem language =
    a [ class Styles.dropdownListItem, onClick (Msg.ChangeLanguage language) ]
        [ text (Language.langToString language) ]
