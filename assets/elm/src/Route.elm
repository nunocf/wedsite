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
    | GuestList String
    | Complete String


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Code (s "rsvp")
        , Parser.map Coming (s "rsvp" </> string)
        , Parser.map GuestList (s "rsvp/guests" </> string)
        , Parser.map Complete (s "rsvp/complete" </> string)
        ]



-- PUBLIC HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


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

                GuestList code ->
                    ["rsvp", "guests", code]

                Complete code ->
                    [ "rsvp", "complete", code ]
    in
    "#/" ++ String.join "/" pieces
