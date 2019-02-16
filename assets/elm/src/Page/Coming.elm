module Page.Coming exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Html exposing (Html, button, div, form, input, p, text)
import Html.Attributes exposing (action, method, name, type_)
import Http
import Json.Decode as Decode exposing (Decoder, nullable)
import Json.Decode.Pipeline exposing (custom, optional, required, resolve)
import Language
import Session exposing (Session, setLanguage)
import Translations exposing (Lang, getLnFromCode)


type alias Model =
    { session : Session
    , form : Form
    }


type alias Form =
    { guests : List Guest
    , invitation : Invitation
    }


type alias Guest =
    { name : Name
    , diet : Diet
    , allergies : Allergies
    }


type alias Coming =
    Bool


type alias Allergies =
    Maybe String


type alias Invitation =
    { code : Code
    , preferedLang : Lang
    , maxGuests : Int
    , coming : Coming
    }


type Diet
    = Normal Course
    | Vegetarian
    | Halal
    | Other DietNeeds


type alias Code =
    String


type alias Name =
    String


type alias DietNeeds =
    String


type Course
    = Meat1
    | Meat2


init : Session -> String -> ( Model, Cmd Msg )
init session code =
    ( Model session { guests = [], invitation = Invitation code Translations.En 2 False }
    , Api.get (Endpoint.rsvp code) (Http.expectJson GotResponse decoder)
    )


type Msg
    = GotResponse (Result Http.Error Form)


view : Model -> { title : String, content : Html Msg }
view { session, form } =
    { title = "Wedsite"
    , content =
        div []
            [ text <| "code " ++ form.invitation.code ++ " EXISTS IN OUR MEGA DATABASE!!!"
            , div []
                (form.guests
                    |> List.map (\g -> p [] [text g.name])
                )
            ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse result ->
            case result of
                Ok form ->
                    ( { model | form = form, session = setLanguage model.session form.invitation.preferedLang }
                    , Cmd.none
                    )

                Err _ ->
                    ( model, Cmd.none )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


decoder : Decoder Form
decoder =
    Decode.field "data" formDecoder


formDecoder : Decoder Form
formDecoder =
    Decode.succeed Form
        |> required "guests" (Decode.list decodeGuest)
        |> required "invitation" decodeInvitation


decodeInvitation : Decoder Invitation
decodeInvitation =
    Decode.succeed Invitation
        |> required "code" Decode.string
        |> required "lang" Language.langDecoder
        |> required "max_guests" Decode.int
        |> required "coming" Decode.bool


decodeGuest : Decoder Guest
decodeGuest =
    Decode.succeed guestDecoder
        |> required "name" Decode.string
        |> required "diet_type" (nullable Decode.string)
        |> required "food_choice" (nullable Decode.string)
        |> required "diet_notes" (nullable Decode.string)
        |> required "has_food_allergies" Decode.bool
        |> optional "food_allergy_notes" Decode.string ""
        |> resolve


guestDecoder : String -> Maybe String -> Maybe String -> Maybe String -> Bool -> String -> Decoder Guest
guestDecoder name diet foodOption dietNotes hasAllergies allergyNotes =
    let
        dietType =
            getDietType diet foodOption dietNotes

        allergies =
            case hasAllergies of
                True ->
                    Just allergyNotes

                False ->
                    Nothing
    in
    Decode.succeed (Guest name dietType allergies)


getDietType : Maybe String -> Maybe String -> Maybe String -> Diet
getDietType diet foodOption notes =
    case diet of
        Just dietType ->
            case dietType of
                "normal" ->
                    getFoodOption foodOption

                "vegetarian" ->
                    Vegetarian

                "halal" ->
                    Halal

                _ ->
                    notes
                        |> Maybe.withDefault ""
                        |> Other

        Nothing ->
            Normal Meat1


getFoodOption : Maybe String -> Diet
getFoodOption foodOption =
    case foodOption of
        Just option ->
            case option of
                "option1" ->
                    Normal Meat1

                "option2" ->
                    Normal Meat2

                _ ->
                    Normal Meat1

        Nothing ->
            Normal Meat1
