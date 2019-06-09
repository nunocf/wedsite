module Api.Endpoint exposing (Endpoint, acceptInvitation, code, complete, guestList, invitedGuests, request, updateEmail)

import Http
import Url.Builder exposing (QueryParameter)


{-| Http.request, except it takes an Endpoint instead of a Url.
-}
request :
    { body : Http.Body
    , expect : Http.Expect msg
    , headers : List Http.Header
    , method : String
    , timeout : Maybe Float
    , url : Endpoint
    }
    -> Cmd msg
request config =
    Http.request
        { body = config.body
        , expect = config.expect
        , headers = config.headers
        , method = config.method
        , timeout = config.timeout
        , url = unwrap config.url
        , tracker = Nothing
        }



-- Types


type Endpoint
    = Endpoint String


unwrap : Endpoint -> String
unwrap (Endpoint str) =
    str


url : List String -> List QueryParameter -> Endpoint
url paths queryParams =
    Url.Builder.relative
        ("api" :: paths)
        queryParams
        |> Endpoint


code : Endpoint
code =
    url [ "code" ] []


acceptInvitation : String -> Endpoint
acceptInvitation invitationCode =
    url [ "rsvp", invitationCode ] []


updateEmail : String -> Endpoint
updateEmail invitationCode =
    url [ "complete", invitationCode ] []


complete : Endpoint
complete =
    url [ "complete" ] []


invitedGuests : String -> Endpoint
invitedGuests invitationCode =
    url [ "invite-guests", invitationCode ] []


guestList : Endpoint
guestList =
    url [ "guests" ] []
