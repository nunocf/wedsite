module Page.GuestDetails exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Array exposing (Array)
import Html exposing (..)
import Html.Attributes exposing (action, checked, class, classList, method, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder, nullable)
import Json.Decode.Pipeline exposing (custom, hardcoded, optional, required, resolve)
import Language
import Page.Rsvp.Types as Types exposing (Allergies, Course(..), Diet(..), Guest, GuestsDetailsForm, Name, encodeGuestsDetailsForm, guestsDetailsDecoder)
import Route
import Session exposing (Session, setLanguage)
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
    | GotSubmitResponse (Result Http.Error String)
    | ClickDietOption Index Diet
    | ClickAllergyOption Index Allergies
    | OtherTextAreaInput Index String
    | AllergiesTextAreaInput Index String
    | OnSubmit


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
                    div []
                        [ form [ onSubmit OnSubmit ]
                            ([ viewGreeting lang
                             ]
                                ++ viewGuests lang guestsForm.guests
                                ++ [ div [] [ button [] [ text "Submit" ] ] ]
                            )
                        ]
    in
    { title = "Wedsite"
    , content = content
    }


viewGuests : Lang -> List Guest -> List (Html Msg)
viewGuests lang guests =
    guests
        |> Array.fromList
        |> Array.indexedMap (viewGuest lang)
        |> Array.toList


viewGuest : Lang -> Index -> Guest -> Html Msg
viewGuest lang index guest =
    div []
        [ viewGuestName guest
        , viewDietQuestion lang index guest
        , viewAllergyQuestion lang index guest
        ]


viewGuestName : Guest -> Html Msg
viewGuestName guest =
    div [] [ text guest.name ]


viewDietQuestion : Lang -> Index -> Guest -> Html Msg
viewDietQuestion lang index guest =
    let
        isNormal =
            guest.diet == Normal Meat1 || guest.diet == Normal Meat2

        isVegetarian =
            guest.diet == Vegetarian

        isHalal =
            guest.diet == Halal

        isOther =
            case guest.diet of
                Other _ ->
                    True

                _ ->
                    False

        otherNotes =
            if isOther == True then
                div []
                    [ textarea
                        [ placeholder "Tell us more! We don't want you to starve"
                        , onInput <| OtherTextAreaInput index
                        ]
                        []
                    ]

            else
                div [] []

        viewSelectNormalFood =
            if isNormal == True then
                courseOption lang index guest

            else
                div [] []

        labelName =
            "diet-" ++ guest.id
    in
    div [ class "control" ]
        [ div [] [ text "What are your feasting habits?" ]
        , div []
            [ label [ class "radio", onClick <| ClickDietOption index <| Normal Meat1 ]
                [ input [ type_ "radio", name labelName, checked isNormal ] []
                , text "🍗 Normal 🍖"
                ]
            ]
        , div []
            [ label [ class "radio", onClick <| ClickDietOption index Vegetarian ]
                [ input [ type_ "radio", name labelName, checked isVegetarian ] []
                , text "\u{1F966} Vegetarian \u{1F951}"
                ]
            ]
        , div []
            [ label [ class "radio", onClick <| ClickDietOption index Halal ]
                [ input [ type_ "radio", name labelName, checked isHalal ] []
                , text "\u{1F54C} Halal \u{1F54C}"
                ]
            ]
        , div []
            [ label [ class "radio", onClick <| ClickDietOption index (Other "") ]
                [ input [ type_ "radio", name labelName, checked isOther ] []
                , text "Other"
                ]
            ]
        , otherNotes
        , viewSelectNormalFood
        ]


viewAllergyQuestion : Lang -> Index -> Guest -> Html Msg
viewAllergyQuestion lang index guest =
    let
        hasAllergies =
            case guest.allergies of
                Just _ ->
                    True

                Nothing ->
                    False

        viewAllergyNotes =
            if hasAllergies == True then
                div []
                    [ textarea
                        [ placeholder "Tell us more! We don't want you to die"
                        , onInput <| AllergiesTextAreaInput index
                        ]
                        []
                    ]

            else
                div [] []

        labelName =
            "allergies-" ++ guest.id
    in
    div [ class "control" ]
        [ div [] [ text "Do you have any food allergies? \u{1F95C} 🍫" ]
        , div []
            [ label [ class "radio", onClick <| ClickAllergyOption index (Just "") ]
                [ input [ type_ "radio", name labelName, checked hasAllergies ] []
                , text "Yes"
                ]
            ]
        , div []
            [ label [ class "radio", onClick <| ClickAllergyOption index Nothing ]
                [ input [ type_ "radio", name labelName, checked (not hasAllergies) ] []
                , text "No"
                ]
            ]
        , viewAllergyNotes
        ]


courseOption : Lang -> Index -> Guest -> Html Msg
courseOption lang index guest =
    let
        isMeat1 =
            guest.diet == Normal Meat1

        labelName =
            "food-choice-" ++ guest.id
    in
    div []
        [ div []
            [ label [ class "radio", onClick <| ClickDietOption index <| Normal Meat1 ]
                [ input [ type_ "radio", name labelName, checked isMeat1 ] []
                , text "Tasty tasty Serbian Schnitzel"
                ]
            ]
        , div []
            [ label [ class "radio", onClick <| ClickDietOption index <| Normal Meat2 ]
                [ input [ type_ "radio", name labelName, checked (not isMeat1) ] []
                , text "Pork with dates and stuff"
                ]
            ]
        ]


viewGreeting : Lang -> Html msg
viewGreeting lang =
    -- replace with translation
    div [] [ text "Victim food preferences" ]


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

        GotSubmitResponse response ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form errors ->
                    case response of
                        Ok status ->
                            let
                                nav =
                                    Session.navKey model.session

                                newUrl =
                                    Route.Complete form.invitation.code
                            in
                            ( { model | state = Ready form errors }
                            , Route.replaceUrl nav newUrl
                            )

                        Err _ ->
                            ( model, Cmd.none )

        OnSubmit ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form errors ->
                    let
                        body =
                            Http.jsonBody (encodeGuestsDetailsForm form)

                        endpoint =
                            Endpoint.acceptInvitation form.invitation.code

                        expectedResult =
                            Http.expectJson GotSubmitResponse decoderSubmitResponse

                        postRequestCmd =
                            Api.post endpoint body expectedResult
                    in
                    ( model, postRequestCmd )

        ClickDietOption index diet ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        updatedModel =
                            form.guests
                                |> Array.fromList
                                |> updateGuestDietInGuests index diet
                                |> updateGuestsInForm form
                                |> updateFormInModel model
                    in
                    ( updatedModel, Cmd.none )

        OtherTextAreaInput index notes ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        updatedModel =
                            form.guests
                                |> Array.fromList
                                |> updateGuestDietInGuests index (Other notes)
                                |> updateGuestsInForm form
                                |> updateFormInModel model
                    in
                    ( updatedModel, Cmd.none )

        AllergiesTextAreaInput index notes ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        updatedModel =
                            form.guests
                                |> Array.fromList
                                |> updateGuestAllergiesInGuests index (Just notes)
                                |> updateGuestsInForm form
                                |> updateFormInModel model
                    in
                    ( updatedModel, Cmd.none )

        ClickAllergyOption index allergies ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        updatedModel =
                            form.guests
                                |> Array.fromList
                                |> updateGuestAllergiesInGuests index allergies
                                |> updateGuestsInForm form
                                |> updateFormInModel model
                    in
                    ( updatedModel, Cmd.none )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


updateFormInModel : Model -> GuestsDetailsForm -> Model
updateFormInModel model form =
    { model | state = Ready form [] }


updateGuestDietInGuests : Int -> Diet -> Array Guest -> List Guest
updateGuestDietInGuests index diet guests =
    let
        guest =
            Array.get index guests

        guestList =
            case guest of
                Just g ->
                    Array.set index { g | diet = diet } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


updateGuestAllergiesInGuests : Int -> Allergies -> Array Guest -> List Guest
updateGuestAllergiesInGuests index allergies guests =
    let
        guest =
            Array.get index guests

        guestList =
            case guest of
                Just g ->
                    Array.set index { g | allergies = allergies } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


updateGuestsInForm : GuestsDetailsForm -> List Guest -> GuestsDetailsForm
updateGuestsInForm form guests =
    { form | guests = guests }


decoderSubmitResponse : Decoder String
decoderSubmitResponse =
    Decode.field "status" Decode.string
