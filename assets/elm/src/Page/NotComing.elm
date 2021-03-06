module Page.NotComing exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Array exposing (Array)
import Asset
import Html exposing (..)
import Html.Attributes exposing (checked, class, name, placeholder, src, type_, value, width)
import Html.Events exposing (onClick, onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode
import Language
import Page.Rsvp.Types as Types exposing (Code, guestsDetailsDecoder)
import Route
import Session exposing (Session, setLanguage)
import Styles
import Translations exposing (Lang, getLnFromCode)


type alias Model =
    { session : Session
    , state : State
    }


type alias State =
    { code : Code
    , email : Maybe String
    }


type alias Index =
    Int


init : Session -> String -> ( Model, Cmd Msg )
init session code =
    ( Model session (State code Nothing), Cmd.none )


type Msg
    = InputEmail String
    | GoHome


view : Model -> { title : String, content : Html Msg }
view model =
    let
        lang =
            Session.lang model.session

        content =
            let
                emailValue =
                    Maybe.withDefault "" model.state.email
            in
            div [ class Styles.formSection ]
                [ div [ class "formGrid" ]
                    [ div [ class "pl-1 pr-1 mt-1 formContainer has-text-centered" ]
                        [ p [ class " is-size-3 font-amatic font-heavy form-heading-color mb-0-5" ]
                            [ text <| Translations.shocking lang ]
                        , div [ class "mt-1 p-1" ]
                            [ img [ class "poemPhoto", Asset.src Asset.error ] [] ]
                        , p [ class "is-size-6 fira mt-1 has-text-left textShadow poemTextColor p-1" ]
                            [ text <| Translations.changeMind lang ]
                        , div [ class "mt-1" ]
                            [ button [ onClick GoHome, class <| Styles.modalButton ++ " border-black" ]
                                [ text <| Translations.okBai lang ]
                            ]
                        ]
                    ]
                ]
    in
    { title = "Wedsite"
    , content = content
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GoHome ->
            ( model, Route.replaceUrl (Session.navKey model.session) Route.Home )

        InputEmail email ->
            let
                state =
                    model.state

                newState =
                    { state | email = Just email }
            in
            ( { model | state = newState }, Cmd.none )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


decoderSubmitResponse : Decoder String
decoderSubmitResponse =
    Decode.field "status" Decode.string
