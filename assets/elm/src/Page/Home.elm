module Page.Home exposing (init, subscriptions, toSession, update, view)

import Asset
import Html exposing (..)
import Html.Attributes exposing (attribute, class, src, style, type_)
import Json.Decode as Decode
import Page.Home.Accomodation as Accomodation
import Page.Home.Gmaps as Gmaps exposing (addMarkers, mapMoved, moveMap)
import Page.Home.Locations as Loc exposing (Locations)
import Page.Home.Poem as Poem
import Page.Home.Schedule as Schedule
import Page.Home.Travelling as Travelling
import Page.Home.Types exposing (ActiveTab(..), Modal, Model, Msg(..))
import Session exposing (Session)
import Styles
import Task
import Time
import Translations



-- MODEL


init : Session -> ( Model, Cmd Msg )
init session =
    let
        locations =
            Loc.init
    in
    ( { session = session
      , locations = Loc.init
      , activeModal = Nothing
      , activeTab = Location
      , time = Time.millisToPosix 0
      , zone = Time.utc
      , weddingDay = Time.millisToPosix 1567846800000
      }
    , Cmd.batch
        [ Gmaps.initMaps <| Loc.encode locations
        , Gmaps.moveMap <| Loc.encodeLocation locations.groomHouse
        , Gmaps.moveMap <| Loc.encodeLocation locations.brideHouse
        , Gmaps.moveMap <| Loc.encodeLocation locations.church
        , Gmaps.moveMap <| Loc.encodeLocation locations.restaurant
        , Task.perform AdjustTimeZone Time.here
        ]
    )



-- VIEW


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Wedsite"
    , content =
        div []
            ([ viewHero model
             , viewOurStory
             , viewSchedule
             , viewTravelling model
             , viewAccomodation model
             ]
                |> List.map (\section -> section <| Session.lang model.session)
            )
    }


padDigit : Int -> String
padDigit digit =
    if digit >= 0 && digit < 10 then
        "0" ++ String.fromInt digit

    else
        String.fromInt digit


dayInMilis =
    24 * 60 * 60 * 1000


hourInMilis =
    60 * 60 * 1000


minuteInMilis =
    60 * 1000


viewHero : Model -> Translations.Lang -> Html msg
viewHero model lang =
    let
        hour =
            padDigit <| Time.toHour model.zone model.time

        minute =
            padDigit <| Time.toMinute model.zone model.time

        second =
            padDigit <| Time.toSecond model.zone model.time

        clock =
            if Time.posixToMillis model.time == 0 then
                div [] []

            else
                h1 [] [ text (hour ++ ":" ++ minute ++ ":" ++ second) ]

        countDown =
            remainingTimeLeft model.weddingDay model.time
    in
    section [ class Styles.hero ]
        [ div [ class "landingText" ]
            [ h1 [ class <| Styles.headingFormatting ]
                [ text <| Translations.doingIt lang ]
            , p [ class <| Styles.landingPageMiddle ]
                [ text <| Translations.mrMrsFerreira lang ]
            , h3 [ class <| Styles.headingFormatting ]
                [ text <| Translations.date lang ]
            ]
        , div [ class "landingCountdown" ]
            [ h1 [ class <| Styles.headingFormatting ]
                [ p [] [ text <| "Time left for the big event!" ]
                , countDown
                ]
            ]
        ]


remainingTimeLeft : Time.Posix -> Time.Posix -> Html msg
remainingTimeLeft finalTime currentTime =
    let
        milisLeft =
            Time.posixToMillis finalTime - Time.posixToMillis currentTime

        remainingHours =
            milisLeft - (daysLeft * dayInMilis)

        remainingMinutes =
            remainingHours - (hoursLeft * hourInMilis)

        remainingSeconds =
            remainingMinutes - (minutesLeft * minuteInMilis)

        daysLeft =
            milisLeft // dayInMilis

        hoursLeft =
            remainingHours // hourInMilis

        minutesLeft =
            remainingMinutes // minuteInMilis

        secondsLeft =
            remainingSeconds // 1000
    in
    div [ class "countdownContainer" ]
        [ div []
            [ div [ class "countDownValueContainer" ] [ text <| String.fromInt daysLeft ]
            , p [ class "is-size-5" ] [ text <| "Days" ]
            ]
        , div []
            [ div [ class "countDownValueContainer" ] [ text <| String.fromInt hoursLeft ]
            , p [ class "is-size-5" ] [ text <| "Hours" ]
            ]
        , div []
            [ div [ class "countDownValueContainer" ] [ text <| String.fromInt minutesLeft ]
            , p [ class "is-size-5" ] [ text <| "Minutes" ]
            ]
        , div []
            [ div [ class "countDownValueContainer" ] [ text <| String.fromInt secondsLeft ]
            , p [ class "is-size-5" ] [ text <| "Seconds" ]
            ]
        ]


viewOurStory : Translations.Lang -> Html msg
viewOurStory lang =
    div [ class <| Styles.ourStory ]
        [ div [ class "mb-2" ]
            [ div [ class "ourStoryContainer" ]
                [ div [ class "flowerSideLeft desktop" ]
                    [ object [ type_ "image/svg+xml", attribute "data" "svg/flowerstripleft.svg" ] [ text "Your browser does not support SVGs" ]
                    ]
                , div [ class "poemViewFrameContainer" ]
                    [ div [ class "poemViewFrame poemContent" ]
                        [ div [ class "has-text-centered poemHeader" ]
                            [ h1 [ class <| String.join " " [ Styles.headingFormatting, "poemTitle" ] ]
                                [ text <| Translations.ourStoryTitle lang ]
                            ]
                        , div [ class "poem1" ] [ Poem.viewPoem1 lang ]
                        , div [ class "poemPicture is-hidden-mobile" ]
                            [ img [ class "poemPhoto", Asset.src Asset.stonehenge ] []
                            ]
                        , div [ class "poem2" ] [ Poem.viewPoem2 lang ]
                        , div [ class "poem3" ] [ Poem.viewPoem3 lang ]
                        ]
                    ]
                , div [ class "flowerSideRight  desktop" ]
                    [ object [ type_ "image/svg+xml", attribute "data" "svg/flowerstripright.svg" ] [ text "Your browser does not support SVGs" ]
                    ]
                ]
            ]
        ]


viewSchedule : Translations.Lang -> Html msg
viewSchedule lang =
    div [ class Styles.scheduleSection ]
        [ div [ class "scheduleContainer" ]
            [ Schedule.viewHeader lang
            , Schedule.viewGroom lang
            , Schedule.viewBride lang
            , Schedule.viewChurch lang
            , Schedule.viewVenue lang
            ]
        ]


viewTravelling : Model -> Translations.Lang -> Html Msg
viewTravelling model lang =
    div [ class Styles.travellingSection ]
        [ Travelling.view model lang ]


viewAccomodation : Model -> Translations.Lang -> Html Msg
viewAccomodation model lang =
    div [ class Styles.accomodationSection ]
        [ Accomodation.view lang model ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MapMoved locationJson ->
            let
                newModel =
                    case Decode.decodeValue Loc.decodeLocation locationJson of
                        Ok location ->
                            location
                                |> Loc.setLocation model.locations
                                |> setLocations model

                        Err err ->
                            model
            in
            ( model, Cmd.none )

        ActivateModal modal ->
            ( { model | activeModal = Just modal }, Cmd.none )

        DeactivateModal ->
            ( { model | activeModal = Nothing }, Cmd.none )

        ChangeTab selectedTab ->
            ( { model | activeTab = selectedTab }, Cmd.none )

        Tick newTime ->
            ( { model | time = newTime }
            , Cmd.none
            )

        AdjustTimeZone newZone ->
            ( { model | zone = newZone }
            , Cmd.none
            )


setLocations : Model -> Locations -> Model
setLocations model locations =
    { model | locations = locations }


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Gmaps.mapMoved MapMoved
        , Time.every 1000 Tick
        ]
