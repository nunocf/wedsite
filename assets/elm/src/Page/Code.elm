module Page.Code exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Array exposing (Array)
import Browser.Dom as Dom
import Html exposing (Attribute, Html, button, div, form, input, p, text)
import Html.Attributes exposing (action, attribute, class, classList, disabled, maxlength, method, name, placeholder, type_, value)
import Html.Events exposing (keyCode, on, onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode
import Route
import Session exposing (Session)
import Styles
import Task
import Translations


type alias Model =
    { session : Session
    , pin : Array String
    , error : Maybe String
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( Model session (Array.fromList [ "", "", "", "", "", "" ]) Nothing, Cmd.none )


view : Model -> { title : String, content : Html Msg }
view { session, pin, error } =
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
                            [ p [ class "has-text-centered is-size-2 font-amatic font-heavy form-heading-color" ]
                                [ text <| Translations.insertInviteCode lang ]
                            , div [ class "PinContainer" ]
                                (pin |> Array.indexedMap (\i v -> pinInput i v) |> Array.toList)
                            , errorDisplay
                            ]
                        , div [ class "has-text-centered" ]
                            [ button [ class <| Styles.modalButton ++ " border-black" ]
                                [ text <| Translations.codeSubmit lang ]
                            ]
                        ]
                    ]
                ]
            ]
    }


pinInput : Int -> String -> Html Msg
pinInput index v =
    input
        [ type_ "tel"
        , attribute "pattern" "[0-9A-Za-z]*"
        , classList
            [ ( "TextInput", True )
            , ( "PinInputLeft", index == 0 )
            , ( "PinInputMiddle", index == 1 || index == 2 || index == 3 || index == 4 )
            , ( "PinInputRight", index == 5 )
            , ( "fira", True )
            ]
        , onInput (OnPinInput index)
        , onBackspace (Backspace index)
        , attribute "id" ("pin-code-" ++ String.fromInt index)
        , attribute "data-cy" ("pinCode" ++ String.fromInt index)
        , maxlength 1
        , attribute "aria-label" "aaaaaa"
        , value v
        , placeholder "•"
        ]
        []


onBackspace : msg -> Attribute msg
onBackspace msg =
    let
        tagger key =
            case key of
                8 ->
                    Decode.succeed msg

                _ ->
                    Decode.fail "not handling this key"
    in
    on "keyup" (Decode.andThen tagger keyCode)


type Msg
    = NoOp
    | OnSubmit
    | GotResponse (Result Http.Error Bool)
    | OnPinInput Int String
    | Backspace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OnSubmit ->
            let
                pin =
                    String.join "" <| Array.toList model.pin

                body =
                    Http.jsonBody (encode pin)

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
                            let
                                code =
                                    model.pin
                                        |> Array.toList
                                        |> String.join ""
                            in
                            ( { model | error = Nothing }
                            , Route.replaceUrl (Session.navKey model.session) (Route.Coming code)
                            )

                        False ->
                            ( { model | error = Just <| Translations.codeNotFound lang }, Cmd.none )

                Err _ ->
                    ( { model
                        | error = Just <| Translations.errorRequest lang
                      }
                    , Cmd.none
                    )

        OnPinInput index value ->
            let
                pinLen =
                    Array.length model.pin

                newPin =
                    Array.set index value model.pin

                nextInputId =
                    if index < pinLen - 1 then
                        index + 1 |> String.fromInt

                    else
                        index |> String.fromInt

                cmd =
                    if value == "" then
                        Cmd.none

                    else
                        Task.attempt (\_ -> NoOp) (Dom.focus <| "pin-code-" ++ nextInputId)
            in
            ( { model | pin = newPin }, cmd )

        Backspace index ->
            let
                newPin =
                    Array.set index "" model.pin

                nextInputId =
                    if index > 0 then
                        index - 1 |> String.fromInt

                    else
                        index |> String.fromInt
            in
            ( { model | pin = newPin }, Task.attempt (\_ -> NoOp) (Dom.focus <| "pin-code-" ++ nextInputId) )


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
