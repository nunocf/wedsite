module Page.Rsvp exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Html exposing (Html, button, div, form, input, p, text)
import Html.Attributes exposing (action, method, name, type_)
import Http
import Json.Decode as Decode exposing (Decoder)
import Language
import Session exposing (Session)
import Translations exposing (Lang)


type alias Model =
    { session : Session
    , guests : List Guest
    , invitation : Invitation
    }


type alias Guest =
    { coming : Coming
    , name : Name
    , dietNeeds : SpecialDiet
    , foodChoice : FoodChoice
    }


type alias Coming =
    Bool


type alias Invitation =
    { code : Code
    , preferedLang : Lang
    , maxGuests : Int
    , currentGuests : Int
    , needTransport : Bool
    }


type SpecialDiet
    = NoSpecialDiet
    | SpecialDiet String


type alias Code =
    String


type alias Name =
    String


type FoodChoice
    = Meat1
    | Meat2
    | Vegetarian


init : Session -> String -> ( Model, Cmd Msg )
init session code =
    ( Model session [] (Invitation code Translations.En 2 0 False)
    , Api.get (Endpoint.rsvp code) (Http.expectJson GotResponse decoder)
    )


type Msg
    = GotResponse (Result Http.Error String)


view : Model -> { title : String, content : Html Msg }
view { session, guests, invitation } =
    { title = "Wedsite"
    , content =
        div []
            [ text <| "code " ++ invitation.code ++ " EXISTS IN OUR MEGA DATABASE!!!"
            ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse result ->
            case result of
                Ok string ->
                    ( model, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


decoder : Decoder String
decoder =
    Decode.field "status" Decode.string
