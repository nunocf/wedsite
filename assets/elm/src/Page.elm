module Page exposing (Page(..), view, viewErrors)

import Browser exposing (Document)
import Html exposing (Html, a, button, div, footer, i, img, li, main_, nav, p, span, text, ul)
import Html.Attributes exposing (class, classList, href, style)
import Html.Events exposing (onClick)
import Route exposing (Route)
import Session exposing (Session)



-- Determines which navbar link will be rendered as active.


type Page
    = Other
    | Home
    | Code
    | Coming
    | Complete



-- Take a page's Html and frames it with a nav, but nav isn't playing ball


view : Page -> Session -> { title : String, content : Html msg } -> Document msg
view page session { title, content } =
    { title = title
    , body =
        [ content ]
    }


{-| Render dismissable errors.
-}
viewErrors : msg -> List String -> Html msg
viewErrors dismissErrors errors =
    if List.isEmpty errors then
        Html.text ""

        

    else
        div
            [ class "error-messages"
            , style "position" "fixed"
            , style "top" "0"
            , style "background" "rgb(250, 250, 250)"
            , style "padding" "20px"
            , style "border" "1px solid"
            ]
        <|
            List.map (\error -> p [] [ text error ]) errors
                ++ [ button [ onClick dismissErrors ] [ text "Ok" ] ]
