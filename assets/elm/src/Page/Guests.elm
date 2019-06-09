module Page.Guests exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Asset
import Html exposing (..)
import Html.Attributes exposing (attribute, class, src, style, type_)
import Http
import Json.Decode as Decode
import Page.Rsvp.Types as Types exposing (GuestList, guestListDecoder)
import Session exposing (Session)
import Styles
import Task



-- MODEL


type Msg
    = GotResponse (Result Http.Error GuestList)


type alias Model =
    { session : Session
    , state : State
    }


type State
    = Loading
    | Ready GuestList


init : Session -> ( Model, Cmd Msg )
init session =
    ( Model session Loading
    , Api.get Endpoint.guestList (Http.expectJson GotResponse guestListDecoder)
    )



-- VIEW


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Wedsite"
    , content =
        div [ class "background" ]
            [ viewGuestList model
            ]
    }


viewGuestList : Model -> Html msg
viewGuestList model =
    let
        ( gc, gnc, gp ) =
            case model.state of
                Loading ->
                    ( [], [], [] )

                Ready gl ->
                    ( gl.coming, gl.notComing, gl.pending )
    in
    div [ class "is-fullheight hero " ]
        [ div [ class "padded mt-2" ]
            [ p [ class <| Styles.scheduleTimeHeader ++ " mt-2 mb-1" ]
                [ text "Guest List" ]
            , p [ class "fw-500" ]
                [ text <| "Attending: " ++ String.fromInt (List.length gc)
                ]
            , p [ class "fw-500" ]
                [ text <| "Not Attending: " ++ String.fromInt (List.length gnc)
                ]
            , p [ class "fw-500" ]
                [ text <| "Pending: " ++ String.fromInt (List.length gp)
                ]
            , p [ class "mt-2 font-amatic fw-500 is-size-2" ] [ text <| "Attending List: " ]
            , div [] <| List.map (\g -> div [] [ text g.name ]) gc
            , p [ class "mt-2 font-amatic is-size-2" ] [ text <| "Not Coming List: " ]
            , div [] <| List.map (\g -> div [] [ text g.name ]) gnc
            , p [ class "mt-2 font-amatic is-size-2" ] [ text <| "Pending List: " ]
            , div [] <| List.map (\g -> div [] [ text g.name ]) gp
            ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse result ->
            case result of
                Ok guests ->
                    ( { model | state = Ready guests }
                    , Cmd.none
                    )

                Err _ ->
                    ( model, Cmd.none )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
