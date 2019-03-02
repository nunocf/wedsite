module Page.Coming exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Api
import Api.Endpoint as Endpoint
import Array exposing (Array)
import Html exposing (..)
import Html.Attributes exposing (readonly, disabled, action, checked, class, for, id, method, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)
import Http
import Json.Decode as Decode exposing (Decoder, nullable)
import Json.Decode.Pipeline exposing (custom, hardcoded, optional, required, resolve)
import Language
import Page.Rsvp.Types as Types exposing (AcceptForm, Accepted, AdditionalGuest, Coming, Guest, Invitation, Name, acceptFormDecoder, decodeGuest, decodeInvitation, encodeAcceptedForm)
import Route
import Session exposing (Session, setLanguage)
import Styles
import Translations exposing (Lang, getLnFromCode)
import Task
import Browser.Dom as Dom


type alias Model =
    { session : Session
    , state : State
    }


type State
    = Loading
    | Ready AcceptForm ValidationErrors


type alias ValidationErrors =
    List String


init : Session -> String -> ( Model, Cmd Msg )
init session code =
    ( Model session Loading
    , Api.get (Endpoint.acceptInvitation code) (Http.expectJson GotResponse acceptFormDecoder)
    )


type Msg
    = GotResponse (Result Http.Error AcceptForm)
    | GotSubmitResponse (Result Http.Error String)
    | AcceptedClick Accepted
    | ClickedGuest Int Coming
    | ClickedAdditionalGuest Int Coming String
    | InputAdditionalGuest Int String
    | OnSubmit
    | NoOp

view : Model -> { title : String, content : Html Msg }
view model =
    let
        lang =
            Session.lang model.session

        content =
            case model.state of
                Loading ->
                    div [] []

                Ready acceptForm errors ->
                    div [ class Styles.formSection ]
                        [ div [ class "formGrid" ]
                            [ div [ class "formContainer" ]
                                [ form [ onSubmit OnSubmit ]
                                    [ viewAcceptedQuestion lang acceptForm
                                    , viewHowManyQuestion lang acceptForm
                                    , div [ class "has-text-centered mt-1" ]
                                        [ button [ class <| Styles.modalButton ++ " border-black" ]
                                            [ text <| Translations.comingSubmit lang ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
    in
    { title = "Wedsite"
    , content = content
    }


viewAcceptedQuestion : Lang -> AcceptForm -> Html Msg
viewAcceptedQuestion lang form =
    div [ class "has-text-left" ]
        [ viewGreeting lang (Array.fromList form.guests)
        , viewAcceptedRadio lang form.invitation.accepted
        ]


viewGreeting : Lang -> Array Guest -> Html msg
viewGreeting lang guests =
    let
        default =
            Translations.defaultName lang

        guestName =
            case Array.get 0 guests of
                Just guest ->
                    guest.name
                        |> String.split " "
                        |> List.head
                        |> Maybe.withDefault default

                Nothing ->
                    default

        -- replace with translation
        greeting =
            Translations.hello lang ++ guestName ++ Translations.joiningUs lang
    in
    div [ class "pl-1 is-size-3 font-amatic font-heavy form-heading-color mb-0-5" ] [ text <| greeting ]


viewAcceptedRadio : Lang -> Maybe Accepted -> Html Msg
viewAcceptedRadio lang coming =
    div [ class "pl-2 has-text-left field" ]
        [ div [ class "mb-0-5" ]
            [ input [ id "coming1", type_ "radio", name "coming", class "mr-1 is-checkradio is-warning is-medium", checked (coming == Just True) ] []
            , label [ class "textShadow poemTextColor", for "coming1", onClick <| AcceptedClick True ] [ text <| Translations.hellYes lang ]
            ]
        , div [ class "mb-1" ]
            [ input [ id "coming2", type_ "radio", name "coming", class "mr-1 is-checkradio is-warning is-medium", checked (coming == Just False) ] []
            , label [ class "textShadow poemTextColor", for "coming2", onClick <| AcceptedClick False ] [ text <| Translations.hellNo lang ]
            ]
        ]


viewHowManyQuestion : Lang -> AcceptForm -> Html Msg
viewHowManyQuestion lang form =
    let
        accepted =
            case form.invitation.accepted of
                Just True ->
                    True

                Just False ->
                    False

                Nothing ->
                    False
    in
    if accepted == True then
        div [ class "has-text-left" ]
            [ p [ class "mb-0-5 pl-1 is-size-3 font-amatic font-heavy form-heading-color" ] [ text <| Translations.whoComes lang ]
            , div [ class "textShadow poemTextColor pl-2" ] <|
                viewGuestsCheckboxes form.guests
                    ++ viewAdditionalGuestsCheckboxes form.additionalGuests
            ]

    else
        div [] []


viewGuestsCheckboxes : List Guest -> List (Html Msg)
viewGuestsCheckboxes guests =
    guests
        |> Array.fromList
        |> Array.indexedMap guestCheckbox
        |> Array.toList


viewAdditionalGuestsCheckboxes : List AdditionalGuest -> List (Html Msg)
viewAdditionalGuestsCheckboxes guests =
    guests
        |> Array.fromList
        |> Array.indexedMap additionalGuestCheckbox
        |> Array.toList


guestCheckbox : Int -> Guest -> Html Msg
guestCheckbox index guest =
    let
        coming =
            case guest.coming of
                Just value ->
                    value

                Nothing ->
                    False

        guestId =
            guest.name ++ String.fromInt index
    in
    div [ class "field" ]
        [ input [ class "is-checkradio is-warning is-medium", id guestId, type_ "checkbox", checked coming ] []
        , label [ for guestId, onClick (ClickedGuest index (not coming)) ] [ text guest.name ]
        ]


additionalGuestCheckbox : Int -> AdditionalGuest -> Html Msg
additionalGuestCheckbox index { coming, name } =
    let
        nameElement =
            case coming of
                False ->
                    text name
                True ->
                    input [ id addGuestInputId, class "input width45", type_ "text", placeholder name, onInput (InputAdditionalGuest index) ] []

        addGuestId =
            "additionalGuest" ++ String.fromInt index

        addGuestInputId = "addGuestInput" ++ String.fromInt index
    in
    div [ class "field"  ]
        [ input [ id addGuestId, class "is-checkradio is-warning is-medium", type_ "checkbox", checked coming ] []
        , label [ for addGuestId, onClick (ClickedAdditionalGuest index (not coming) addGuestInputId) ] [  ]
        , div [class "is-size-5 di ml--1"] [nameElement]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
          (model, Cmd.none)

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
                                    Route.GuestDetails form.invitation.code
                            in
                            ( { model | state = Ready form errors }
                            , Route.replaceUrl nav newUrl
                            )

                        Err _ ->
                            ( model, Cmd.none )

        AcceptedClick accepted ->
            let
                updatedModel =
                    case model.state of
                        Loading ->
                            model

                        Ready form _ ->
                            accepted
                                |> setAcceptedInInvitation form.invitation
                                |> setInvitationInForm form
                                |> setFormInModel model
            in
            ( updatedModel, Cmd.none )

        ClickedGuest index coming ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        guestArray =
                            Array.fromList form.guests

                        updatedModel =
                            ( index, coming )
                                |> setGuestInGuests guestArray
                                |> setGuestsInForm form
                                |> setFormInModel model
                    in
                    ( updatedModel, Cmd.none )

        ClickedAdditionalGuest index coming id ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        guestArray =
                            Array.fromList form.additionalGuests

                        updatedModel =
                            ( index, coming )
                                |> setGuestInAdditionalGuests guestArray
                                |> setAdditionalGuestsInForm form
                                |> setFormInModel model

                        task =
                            if coming == True then
                                Task.attempt (\_ -> NoOp) (Dom.focus id)
                            else
                                Cmd.none
                    in
                    ( updatedModel, task )

        InputAdditionalGuest index name ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        guestArray =
                            Array.fromList form.additionalGuests

                        updatedModel =
                            ( index, name )
                                |> setGuestNameInAdditionalGuests guestArray
                                |> setAdditionalGuestsInForm form
                                |> setFormInModel model
                    in
                    ( updatedModel, Cmd.none )

        OnSubmit ->
            case model.state of
                Loading ->
                    ( model, Cmd.none )

                Ready form _ ->
                    let
                        body =
                            Http.jsonBody (encodeAcceptedForm form)

                        endpoint =
                            Endpoint.acceptInvitation form.invitation.code

                        expectedResult =
                            Http.expectJson GotSubmitResponse decoderSubmitResponse

                        postRequestCmd =
                            Api.post endpoint body expectedResult
                    in
                    ( model, postRequestCmd )


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


setAcceptedInInvitation : Invitation -> Accepted -> Invitation
setAcceptedInInvitation invitation accepted =
    { invitation | accepted = Just accepted }


setInvitationInForm : AcceptForm -> Invitation -> AcceptForm
setInvitationInForm form invitation =
    { form | invitation = invitation }


setFormInModel : Model -> AcceptForm -> Model
setFormInModel model form =
    { model | state = Ready form [] }


setGuestInGuests : Array Guest -> ( Int, Coming ) -> List Guest
setGuestInGuests guests ( index, coming ) =
    let
        guest =
            Array.get index guests

        guestList =
            case guest of
                Just g ->
                    Array.set index { g | coming = Just coming } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


setGuestInAdditionalGuests : Array AdditionalGuest -> ( Int, Coming ) -> List AdditionalGuest
setGuestInAdditionalGuests guests ( index, coming ) =
    let
        guest =
            Array.get index guests

        guestList =
            case guest of
                Just g ->
                    Array.set index { g | coming = coming } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


setGuestNameInAdditionalGuests : Array AdditionalGuest -> ( Int, String ) -> List AdditionalGuest
setGuestNameInAdditionalGuests guests ( index, name ) =
    let
        guest =
            Array.get index guests

        guestList =
            case guest of
                Just g ->
                    Array.set index { g | name = name } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


setGuestNameInGuests : Array Guest -> ( Int, String ) -> List Guest
setGuestNameInGuests guests ( index, name ) =
    let
        guest =
            Array.get index guests

        guestList =
            case guest of
                Just g ->
                    Array.set index { g | name = name } guests

                Nothing ->
                    guests
    in
    Array.toList guestList


setAdditionalGuestsInForm : AcceptForm -> List AdditionalGuest -> AcceptForm
setAdditionalGuestsInForm form guests =
    { form | additionalGuests = guests }


setGuestsInForm : AcceptForm -> List Guest -> AcceptForm
setGuestsInForm form guests =
    { form | guests = guests }


decoderSubmitResponse : Decoder String
decoderSubmitResponse =
    Decode.field "status" Decode.string
