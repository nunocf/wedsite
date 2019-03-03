module Page exposing (Page(..), view)

import Browser exposing (Document)
import Html exposing (Html, a, button, div, footer, i, img, li, main_, nav, p, span, text, ul)
import Html.Attributes exposing (class, classList, href, style)
import Html.Events exposing (onClick)
import Page.Rsvp.Types exposing (AcceptForm)
import Route exposing (Route)
import Session exposing (Session)



-- Determines which navbar link will be rendered as active.


type Page
    = Other
    | Home
    | Code
    | Coming
    | GuestDetails
    | Complete
    | NotComing



-- Take a page's Html and frames it with a nav, but nav isn't playing ball


view : Page -> Session -> { title : String, content : Html msg } -> Document msg
view page session { title, content } =
    { title = title
    , body =
        [ content ]
    }
