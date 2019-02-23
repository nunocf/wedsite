module Page.Code exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Html exposing (Html, button, div, form, input, p, text)
import Html.Attributes exposing (action, class, method, name, type_, value)
import Html.Events exposing (onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode
import Route
import Session exposing (Session)
import Styles
import Translations


type alias Model =
    { session : Session
    , codeValue : String
    , error : Maybe String
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( Model session "" Nothing, Cmd.none )


view : Model -> { title : String, content : Html Msg }
view { session, codeValue, error } =
    let
        lang =
            Session.lang session

        errorDisplay =
            case error of
                Just errorMsg ->
                    div [] [ text errorMsg ]

                Nothing ->
                    div [] []
    in
    { title = "Wedsite"
    , content =
        div [ class Styles.formSection ]
            [ div [ class "formGrid" ]
                [ div [ class "formContainer" ]
                    [ form [ onSubmit OnSubmit ]
                        [ div []
                            [ p [] [ text <| Translations.insertInviteCode lang ]
                            , input [ type_ "text", value codeValue, onInput OnInput ] []
                            , errorDisplay
                            ]
                        , div [ class "has-text-centered" ]
                            [ button [ class Styles.modalButton ]
                                [ text <| Translations.codeSubmit lang ]
                            ]
                        ]
                    ]
                ]
            ]
    }


type Msg
    = OnInput String
    | OnSubmit
    | GotResponse (Result Http.Error Bool)


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
                    Api.post Endpoint.code body (Http.expectJson GotResponse decoder)
            in
            ( model, postRequestCmd )

        GotResponse result ->
            let
                lang =
                    Session.lang model.session
            in
            case result of
                Ok found ->
                    case found of
                        True ->
                            ( { model | error = Nothing }
                            , Route.replaceUrl (Session.navKey model.session) (Route.Coming model.codeValue)
                            )

                        False ->
                            ( { model | error = Just <| Translations.codeNotFound lang }, Cmd.none )

                Err _ ->
                    ( { model
                        | error = Just <| Translations.errorRequest lang
                      }
                    , Cmd.none
                    )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none



-- JSON


decoder : Decoder Bool
decoder =
    Decode.field "found" Decode.bool


encode : String -> Encode.Value
encode code =
    Encode.object
        [ ( "code", Encode.string code )
        ]
