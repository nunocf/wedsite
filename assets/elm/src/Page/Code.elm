module Page.Code exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint
import Html exposing (Html, button, div, form, input, p, text)
import Html.Attributes exposing (action, method, name, type_, value)
import Html.Events exposing (onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode
import Session exposing (Session)


type alias Model =
    { session : Session
    , codeValue : String
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session, codeValue = "" }, Cmd.none )


view : Model -> { title : String, content : Html Msg }
view { session, codeValue } =
    { title = "Wedsite"
    , content =
        div []
            [ form [ method "POST", action "/api/code", onSubmit OnSubmit ]
                [ div []
                    [ p []
                        [ text "Please insert your invitation code" ]
                    , input
                        [ type_ "text"
                        , name "code"
                        , value codeValue
                        , onInput OnInput
                        ]
                        []
                    ]
                , div [] [ button [] [ text "Submit" ] ]
                ]
            ]
    }


type Msg
    = OnInput String
    | OnSubmit
    | GotCodeResponse (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnInput string ->
            ( { model | codeValue = string }, Cmd.none )

        OnSubmit ->
            let
                body =
                    Http.jsonBody (encode model.codeValue)

                postRequestCmd =
                    Api.post Api.Endpoint.code body (Http.expectJson GotCodeResponse decoder)
            in
            ( model, postRequestCmd )

        GotCodeResponse result ->
            case Debug.log "aaa" result of
                Ok url ->
                    ( model, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none



-- JSON


decoder : Decoder String
decoder =
    Decode.field "status" Decode.string


encode : String -> Encode.Value
encode code =
    Encode.object
        [ ( "code", Encode.string code )
        ]
