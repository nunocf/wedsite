module Route exposing (Route(..), fromUrl, href, parser, replaceUrl)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)



-- ROUTING


type Route
    = Home
    | Code
    | Coming String
    | GuestDetails String
    | Complete String
    | NotComing String
    | Guests


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Code (s "rsvp")
        , Parser.map Coming (s "rsvp" </> string)
        , Parser.map GuestDetails (s "rsvp" </> string </> s "guests")
        , Parser.map Complete (s "rsvp" </> string </> s "complete")
        , Parser.map NotComing (s "rsvp" </> string </> s "not-coming")
        , Parser.map Guests (s "guests")
        ]



-- PUBLIC HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.pushUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser



-- INTERNAL


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Home ->
                    []

                Code ->
                    [ "rsvp" ]

                Coming code ->
                    [ "rsvp", code ]

                GuestDetails code ->
                    [ "rsvp", code, "guests" ]

                Complete code ->
                    [ "rsvp", code, "complete" ]

                NotComing code ->
                    [ "rsvp", code, "not-coming" ]

                Guests ->
                    [ "guests" ]
    in
    "#/" ++ String.join "/" pieces
