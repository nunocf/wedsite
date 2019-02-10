module Page.Home exposing (Model, Msg, init, subscriptions, toSession, update, view)

import Html exposing (..)
import Html.Attributes exposing (class, src, style)
import Json.Decode as Decode
import Page.Home.Accomodation as Accomodation
import Page.Home.Gmaps as Gmaps exposing (addMarkers, mapMoved, moveMap)
import Page.Home.Locations as Loc exposing (Locations)
import Page.Home.Poem as Poem
import Page.Home.Schedule as Schedule
import Page.Home.Travelling as Travelling
import Session exposing (Session)
import Styles
import Translations



-- MODEL


type alias Model =
    { session : Session
    , locations : Locations
    }


init : Session -> ( Model, Cmd msg )
init session =
    let
        locations =
            Loc.init
    in
    ( { session = session
      , locations = Loc.init
      }
    , Cmd.batch
        [ Gmaps.initMaps <| Loc.encode locations
        , Gmaps.moveMap <| Loc.encodeLocation locations.groomHouse
        , Gmaps.moveMap <| Loc.encodeLocation locations.brideHouse
        , Gmaps.moveMap <| Loc.encodeLocation locations.church
        , Gmaps.moveMap <| Loc.encodeLocation locations.restaurant
        ]
    )



-- VIEW


view : Model -> { title : String, content : Html Msg }
view { session, locations } =
    { title = "Wedsite"
    , content =
        div []
            ([ viewHero
             , viewOurStory
             , viewSchedule
             , viewTravelling
             , viewAccomodation
             ]
                |> List.map (\section -> section <| Session.lang session)
            )
    }


viewHero : Translations.Lang -> Html msg
viewHero lang =
    section [ class Styles.hero ]
        [ div [ class "hero-body" ]
            [ div [ class "is-overlay has-text-centered single-spaced", style "top" "84px" ]
                [ h1 [ class "subtitle is-4 has-text-weight-light has-text-black" ] [ text "We're doing it!" ]
                , h2 [ class "title is-1 has-text-black" ] [ text "7 September 2019" ]
                ]
            ]
        ]


viewOurStory : Translations.Lang -> Html msg
viewOurStory lang =
    div [ class Styles.ourStory ]
        [ div [ class "container mb-2" ]
            [ div [ class "has-text-centered" ]
                [ h1 [ class Styles.headingFormatting ]
                    [ text <| Translations.ourStoryTitle lang
                    ]
                ]
            , div [ class "ourStoryContainer" ]
                [ div [] [ Poem.viewPoem1 lang ]
                , div [ class "is-hidden-mobile" ]
                    [ img [ src "https://via.placeholder.com/600x450" ] [] ]
                , div [] [ Poem.viewPoem2 lang ]
                , div [] [ Poem.viewPoem3 lang ]
                ]
            ]
        ]


viewSchedule : Translations.Lang -> Html msg
viewSchedule lang =
    div [ class Styles.scheduleSection ]
        [ div [ class "container" ]
            [ Schedule.viewHeader lang
            , Schedule.viewGroom lang
            , Schedule.viewBride lang
            , Schedule.viewChurch lang
            , Schedule.viewVenue lang
            ]
        ]


viewTravelling : Translations.Lang -> Html msg
viewTravelling lang =
    div [ class Styles.travellingSection ]
        [ div [ class "container" ]
            [ div [ class "columns is-centered" ]
                [ div [ class "column is-two-thirds-desktop" ]
                    [ Travelling.view lang
                    ]
                ]
            ]
        ]


viewAccomodation : Translations.Lang -> Html msg
viewAccomodation lang =
    div [ class Styles.accomodationSection ]
        [ div [ class "container" ]
            [ div [ class "columns is-centered" ]
                [ div [ class "column is-two-thirds-desktop" ]
                    [ Accomodation.view lang
                    ]
                ]
            ]
        ]



-- UPDATE


type Msg
    = MapMoved Decode.Value


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


setLocations : Model -> Locations -> Model
setLocations model locations =
    { model | locations = locations }


toSession : Model -> Session
toSession model =
    model.session


subscriptions : Model -> Sub Msg
subscriptions model =
    Gmaps.mapMoved MapMoved