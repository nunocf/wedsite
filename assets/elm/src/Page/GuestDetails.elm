module Page.GuestDetails exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Array exposing (Array)
import Html exposing (..)
import Html.Attributes exposing (action, checked, class, classList, for, id, method, name, placeholder, rows, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder, nullable)
import Json.Decode.Pipeline exposing (custom, hardcoded, optional, required, resolve)
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
    , Api.get (Endpoint.invitedGuests code) (Http.expectJson GotResponse guestsDetailsDecoder)
    )


type Msg
    = GotResponse (Result Http.Error GuestsDetailsForm)
    | GotSubmitResponse (Result Http.Error String)
    | ClickDietOption Index Diet
    | ClickAllergyOption Index (Maybe Allergies)
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
                    div [ class Styles.formSection ]
                        [ div [ class "formGrid" ]
                            [ div [ class "formContainer" ]
                                [ form [ onSubmit OnSubmit ]
                                    (viewGuests lang guestsForm.guests
                                        ++ [ div [ class "has-text-centered mt-1" ]
                                                [ button [ class <| Styles.modalButton ++ " border-black" ] [ text <| Translations.next lang ]
                                                ]
                                           ]
                                    )
                                ]
                            ]
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
        |> List.intersperse (hr [] [])


viewGuest : Lang -> Index -> Guest -> Html Msg
viewGuest lang index guest =
    div []
        [ viewDietQuestion lang index guest
        , viewAllergyQuestion lang index guest
        ]


viewDietQuestion : Lang -> Index -> Guest -> Html Msg
viewDietQuestion lang index guest =
    let
        firstName =
            guest.name
                |> String.split " "
                |> List.head
                |> Maybe.withDefault ""

        isNormal =
            case guest.diet of
                Just (Normal _) ->
                    True

                _ ->
                    False

        isVegetarian =
            guest.diet == Just Vegetarian

        isHalal =
            guest.diet == Just Halal

        isOther =
            case guest.diet of
                Just (Other _) ->
                    True

                _ ->
                    False

        otherNotes =
            case guest.diet of
                Just (Other notes) ->
                    div []
                        [ textarea
                            [ class "textarea ml-2"
                            , rows 2
                            , placeholder <| Translations.dietNotesPlaceholder lang
                            , onInput <| OtherTextAreaInput index
                            , value notes
                            ]
                            []
                        ]

                _ ->
                    div [] []

        viewSelectNormalFood =
            if isNormal == True then
                courseOption lang index guest

            else
                div [] []

        labelName =
            "diet-" ++ guest.id

        meatId =
            guest.name ++ "meat"

        vegId =
            guest.name ++ "veg"

        halalId =
            guest.name ++ "halal"

        otherId =
            guest.name ++ "other"
    in
    div [ class "control mt-1" ]
        [ div [ class "pl-1 pr-1 is-size-3 font-amatic font-heavy form-heading-color mb-0-5" ] [ text <| firstName ++ Translations.dietQuestion lang ]
        , div [ class "pl-5-5 has-text-left field" ]
            [ div [ class "mb-0-5" ]
                [ input [ class "mr-1 is-checkradio is-warning is-medium", id meatId, type_ "radio", checked isNormal ] []
                , label [ for meatId, class "textShadow poemTextColor", onClick <| ClickDietOption index <| Normal Nothing ] [ text <| Translations.normalDiet lang ]
                ]
            ]
        , div [ class "pl-5-5 has-text-left field" ]
            [ div [ class "mb-0-5" ]
                [ input [ class "mr-1 is-checkradio is-warning is-medium", id vegId, type_ "radio", checked isVegetarian ] []
                , label [ for vegId, class "textShadow poemTextColor", onClick <| ClickDietOption index <| Vegetarian ] [ text <| Translations.vegetarianDiet lang ]
                ]
            ]
        , div [ class "pl-5-5 has-text-left field" ]
            [ div [ class "mb-0-5" ]
                [ input [ class "mr-1 is-checkradio is-warning is-medium", id halalId, type_ "radio", checked isHalal ] []
                , label [ for halalId, class "textShadow poemTextColor", onClick <| ClickDietOption index <| Halal ] [ text <| Translations.halalDiet lang ]
                ]
            ]
        , div [ class "pl-5-5 has-text-left field" ]
            [ div [ class "mb-0-5" ]
                [ input [ class "mr-1 is-checkradio is-warning is-medium", id otherId, type_ "radio", checked isOther ] []
                , label [ for otherId, class "textShadow poemTextColor", onClick <| ClickDietOption index <| Other "" ] [ text <| Translations.otherDiet lang ]
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
            case guest.allergies of
                Just notes ->
                    div []
                        [ textarea
                            [ class "textarea ml-2"
                            , rows 2
                            , placeholder <| Translations.allergyNotesPlaceholder lang
                            , onInput <| AllergiesTextAreaInput index
                            , value notes
                            ]
                            []
                        ]

                Nothing ->
                    div [] []

        labelName =
            "allergies-" ++ guest.id

        allergiesYesId =
            "allergiesYes"

        allergiesNoId =
            "allergiesNo"
    in
    div [ class "control mt-1" ]
        [ div [ class "pl-1 pr-1 is-size-3 font-amatic font-heavy form-heading-color mb-0-5" ] [ text <| Translations.allergyQuestion lang ]
        , div [ class "pl-5-5 has-text-left field" ]
            [ div [ class "mb-0-5" ]
                [ input [ class "mr-1 is-checkradio is-warning is-medium", id allergiesYesId, type_ "radio", checked hasAllergies ] []
                , label [ for allergiesYesId, class "textShadow poemTextColor", onClick <| ClickAllergyOption index (Just "") ] [ text <| Translations.allergyYes lang ]
                ]
            ]
        , div [ class "pl-5-5 has-text-left field" ]
            [ div [ class "mb-0-5" ]
                [ input [ class "mr-1 is-checkradio is-warning is-medium", id allergiesNoId, type_ "radio", checked (not hasAllergies) ] []
                , label [ for allergiesNoId, class "textShadow poemTextColor", onClick <| ClickAllergyOption index Nothing ] [ text <| Translations.allergyNo lang ]
                ]
            ]
        , viewAllergyNotes
        ]


courseOption : Lang -> Index -> Guest -> Html Msg
courseOption lang index guest =
    let
        isMeat1 =
            case guest.diet of
                Just (Normal option) ->
                    case option of
                        Just Meat1 ->
                            True

                        _ ->
                            False

                _ ->
                    False

        isMeat2 =
            guest.diet == (Just <| Normal <| Just Meat2)

        labelName =
            "food-choice-" ++ guest.id

        foodChoiceId =
            guest.name ++ "-food"
    in
    div [ class "has-text-left field mt-1" ]
        [ div [ class "pl-1 pr-1 is-size-3 font-amatic font-heavy form-heading-color mb-0-5" ] [ text <| Translations.courseQuestion lang ]
        , div [ class "pl-5-5 mb-0-5 w80" ]
            [ input [ id foodChoiceId, type_ "radio", class "mr-1 is-checkradio is-warning is-medium", checked <| isMeat1 ] []
            , label [ class "textShadow poemTextColor", for foodChoiceId, onClick <| ClickDietOption index <| Normal <| Just Meat1 ] [ text <| Translations.course1 lang ]
            ]
        , div
            [ class "pl-5-5 mb-0-5 w80" ]
            [ input [ id foodChoiceId, type_ "radio", class "mr-1 is-checkradio is-warning is-medium", checked isMeat2 ] []
            , label [ class "textShadow poemTextColor", for foodChoiceId, onClick <| ClickDietOption index <| Normal <| Just Meat2 ] [ text <| Translations.course2 lang ]
            ]
        ]


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
                    Array.set index { g | diet = Just diet } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


updateGuestAllergiesInGuests : Int -> Maybe Allergies -> Array Guest -> List Guest
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
