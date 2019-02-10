module Page.Rsvp exposing (view)

import Html exposing (Html, button, div, form, input, p, text)
import Html.Attributes exposing (action, method, name, type_)
import Session exposing (Session)


type alias Model =
    { session : Session
    }


view : Model -> Html msg
view model =
    div []
        [ text "aaaaaa"
        ]
