module Page.Complete exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Array exposing (Array)
import Asset
import Html exposing (..)
import Html.Attributes exposing (checked, class, name, placeholder, src, width)
import Html.Events exposing (onClick, onInput, onSubmit)
import Http
import Language
import Page.Rsvp.Types as Types exposing (Allergies, Course(..), Diet(..), Guest, GuestsDetailsForm, Name, encodeGuestsDetailsForm, guestsDetailsDecoder)
import Route
import Session exposing (Session, setLanguage)
import Styles
import Translations exposing (Lang, getLnFromCode)


type alias Model =
    { session : Session
    , state : State
    }


type State
    = Loading
    | Ready GuestsDetailsForm ValidationErrors


type alias ValidationErrors =
    List String


type alias Index =
    Int


init : Session -> String -> ( Model, Cmd Msg )
init session code =
    ( Model session Loading
    , Api.get (Endpoint.acceptInvitation code) (Http.expectJson GotResponse guestsDetailsDecoder)
    )


type Msg
    = GotResponse (Result Http.Error GuestsDetailsForm)
    | GoHome


view : Model -> { title : String, content : Html Msg }
view model =
    let
        lang =
            Session.lang model.session

        content =
            case model.state of
                Loading ->
                    div [] []

                Ready guestsForm errors ->
                    div [ class Styles.formSection ]
                        [ div [ class "formGrid" ]
                            [ div [ class "formContainer" ]
                                [ p [] [ text "Cool! We're done." ]
                                , p [] [ text "We're already preparing to party!!" ]
                                , img [ width 300, Asset.src Asset.complete ] []
                                , p [] [ text "We cant wait to see you!" ]
                                , div [ class "has-text-centered" ]
                                    [ button [ onClick GoHome, class <| Styles.modalButton ++ " border-black" ]
                                        [ text "OMG! Bye!" ]
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
        GotResponse result ->
            case result of
                Ok form ->
                    ( { model | state = Ready form [], session = setLanguage model.session form.invitation.preferedLang }
                    , Cmd.none
                    )

                Err _ ->
                    ( model, Cmd.none )

        GoHome ->
            ( model, Route.replaceUrl (Session.navKey model.session) Route.Home )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none
