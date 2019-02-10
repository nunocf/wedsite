module Api exposing (get, post, put)

import Api.Endpoint as Endpoint exposing (Endpoint, request)
import Http exposing (Body, Expect)
import Json.Decode as Decode exposing (Decoder, Value, decodeString, field, string)


get : Endpoint -> Expect msg -> Cmd msg
get url expect =
    request
        { method = "GET"
        , url = url
        , expect = expect
        , headers = []
        , body = Http.emptyBody
        , timeout = Nothing
        }


put : Endpoint -> Body -> Expect msg -> Cmd msg
put url body expect =
    request
        { method = "PUT"
        , url = url
        , expect = expect
        , headers = []
        , body = body
        , timeout = Nothing
        }


post : Endpoint -> Body -> Expect msg -> Cmd msg
post url body expect =
    request
        { method = "POST"
        , url = url
        , expect = expect
        , headers = []
        , body = body
        , timeout = Nothing
        }
