module Page.Home.Travelling exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, href, target, type_)
import Html.Events exposing (onClick)
import Page.Home.Types exposing (ActiveTab(..), Model, Msg(..))
import Styles
import Translations exposing (Lang)


view : Model -> Lang -> Html Msg
view model lang =
    div [ class "has-text-centered pt-1" ]
        [ div [ class "travellingGrid" ]
            [ div [ class "travelTitle pb-2" ]
                [ h1 [ class <| Styles.headingFormatting ]
                    [ text <| Translations.travellingHeader lang ]
                ]
            , div [ class "flowerSideLeft desktop" ]
                [ object [ class "tf", type_ "image/svg+xml", attribute "data" "svg/flowerstripleft.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "travellingFrame" ]
                [ viewTravellingMenu model lang
                , viewTravellingContent model lang
                ]
            , div [ class "flowerSideRight desktop" ]
                [ object [ class "tf", type_ "image/svg+xml", attribute "data" "svg/flowerstripright.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            ]
        ]


viewTravellingMenu : Model -> Lang -> Html Msg
viewTravellingMenu model lang =
    let
        carRentalMenuItem =
            if lang == Translations.Rs then
                div [] []

            else
                viewMenuTab (Translations.carRentalTitle lang) "fa-key" (ChangeTab RentCar) (model.activeTab == RentCar)

        airplaneMenuItem =
            if lang == Translations.Rs then
                div [] []

            else
                viewMenuTab (Translations.airplane lang) "fa-fighter-jet" (ChangeTab Airplane) (model.activeTab == Airplane)

        hikingMenu =
            if lang == Translations.Rs then
                div [] [ viewMenuTab (Translations.walkAndSwimTitle lang) "fa-hiking" (ChangeTab Walk) (model.activeTab == Walk) ]

            else
                viewMenuTab (Translations.walkAndSwimTitle lang) "fa-hiking" (ChangeTab Walk) (model.activeTab == Walk)
    in
    div [ class "travellingMenu menuFontColor" ]
        [ viewMenuTab (Translations.location lang) "fa-search-location" (ChangeTab Location) (model.activeTab == Location)
        , airplaneMenuItem
        , viewMenuTab (Translations.trainsTitle lang) "fa-train" (ChangeTab Train) (model.activeTab == Train)
        , viewMenuTab (Translations.busTitle lang) "fa-bus-alt" (ChangeTab Bus) (model.activeTab == Bus)
        , viewMenuTab (Translations.carTitle lang) "fa-car-side" (ChangeTab Car) (model.activeTab == Car)
        , viewMenuTab (Translations.motorbikeTitle lang) "fa-bicycle" (ChangeTab Bike) (model.activeTab == Bike)
        , hikingMenu
        , carRentalMenuItem
        ]


viewMenuTab : String -> String -> Msg -> Bool -> Html Msg
viewMenuTab title iconClass msg isActive =
    let
        tabClasses =
            if isActive then
                [ Styles.travelMenuItem, "tabSelected" ] |> String.join " "

            else
                Styles.travelMenuItem
    in
    div [ class tabClasses, onClick msg ]
        [ i [ class <| "vc fas " ++ iconClass ] []
        , div [ class "desktop" ] [ text title ]
        ]


viewTravellingContent : Model -> Lang -> Html Msg
viewTravellingContent model lang =
    let
        content =
            case model.activeTab of
                Location ->
                    viewLocation lang

                Airplane ->
                    planeTravel lang

                Train ->
                    trainTravel lang

                Bus ->
                    busTravel lang

                Car ->
                    carTravel lang

                Bike ->
                    bikeTravel lang

                Walk ->
                    walkTravel lang

                RentCar ->
                    rentalTravel lang
    in
    div [ class "travellingContent" ]
        [ div [ class "travelText" ] [ content ]
        ]


viewLocation : Lang -> Html msg
viewLocation lang =
    div []
        [ viewLocationText lang
        ]


viewLocationText : Lang -> Html msg
viewLocationText lang =
    div [ class Styles.textFont ]
        [ p [ class "text-justified mb-1" ] [ text <| Translations.travellingSubtitle0 lang ]
        , p [ class "text-justified mb-1" ] [ a [ href <| Translations.coordinatesLink lang, target "_blank" ] [ text <| Translations.coordinates lang ] ]
        , p [ class "text-justified mb-1" ] [ text <| Translations.travellingSubtitle1 lang ]
        ]


planeTravel : Lang -> Html msg
planeTravel lang =
    div []
        [ planeTravelText lang
        ]


planeTravelText : Lang -> Html msg
planeTravelText lang =
    let
        content =
            case lang of
                Translations.Pt ->
                    [ planeTravelFirstParagraph lang
                    , planeTravelThirdParagraph lang
                    ]
                        ++ planeTravelSecondParagraph lang

                _ ->
                    [ planeTravelFirstParagraph lang ]
                        ++ planeTravelSecondParagraph lang
                        ++ [ planeTravelThirdParagraph lang
                           ]
    in
    div [ class Styles.textFont ] content


planeTravelFirstParagraph : Lang -> Html msg
planeTravelFirstParagraph lang =
    p [ class "text-justified mb-1" ]
        [ [ Translations.mainAirport0
          , Translations.belgradeAirport
          , Translations.mainAirport1
          ]
            |> List.map (\fn -> fn lang)
            |> String.join " "
            |> text
        ]


planeTravelSecondParagraph : Lang -> List (Html msg)
planeTravelSecondParagraph lang =
    let
        content =
            case lang of
                Translations.Pt ->
                    ptCloseAirports lang

                _ ->
                    enCloseAirports lang
    in
    content


ptCloseAirports : Lang -> List (Html msg)
ptCloseAirports lang =
    let
        closeOpen s =
            "), "
                ++ s
                ++ " ("

        start =
            Translations.mainAirportSecondParagraph0 lang
                ++ Translations.londonLuton lang
                ++ " ("

        end =
            "), " ++ Translations.etc lang
    in
    [ p [ class "text-justified mb-1" ]
        [ text <| Translations.mainAirportSecondParagraph0 lang
        , a [ target "_blank", href <| Translations.wizzAirUrl lang ] [ text <| Translations.wizzAir lang ]
        , text <| Translations.mainAirportSecondParagraph1 lang
        ]
    , p [ class "text-justified mb-1" ]
        [ text <| Translations.mainAirportSecondParagraph2 lang
        , a [ href <| Translations.lufthansaUrl lang, target "_blank" ] [ text <| Translations.lufthansa lang ]
        , text ", "
        , a [ href <| Translations.tapUrl lang, target "_blank" ] [ text <| Translations.tap lang ]
        , text ", "
        , a [ href <| Translations.airSerbiaUrl lang, target "_blank" ] [ text <| Translations.airSerbia lang ]
        , text ", "
        , a [ href <| Translations.vuelingUrl lang, target "_blank" ] [ text <| Translations.vueling lang ]
        , text <| Translations.and lang
        , a [ href <| Translations.aegaen lang, target "_blank" ] [ text <| Translations.aegaen lang ]
        , text "."
        ]
    , p [ class "text-justified mb-1" ]
        [ text <| Translations.mainAirportSecondParagraph3 lang
        , a [ href <| Translations.ryanAirUrl lang, target "_blank" ] [ text <| Translations.ryanAir lang ]
        , text ", "
        , a [ href <| Translations.wizzAirUrl lang, target "_blank" ] [ text <| Translations.wizzAir lang ]
        , text ", "
        , a [ href <| Translations.lufthansaUrl lang, target "_blank" ] [ text <| Translations.lufthansa lang ]
        , text "."
        ]
    , p [ class "text-justified mb-1" ]
        [ text <| Translations.mainAirportSecondParagraph4 lang
        , a [ href <| Translations.ryanAirUrl lang, target "_blank" ] [ text <| Translations.ryanAir lang ]
        , text <| Translations.mainAirportSecondParagraph5 lang
        , a [ href <| Translations.wizzAirUrl lang, target "_blank" ] [ text <| Translations.wizzAir lang ]
        , text <| Translations.mainAirportSecondParagraph6 lang
        , a [ href <| Translations.tapUrl lang, target "_blank" ] [ text <| Translations.tap lang ]
        , text <| Translations.mainAirportSecondParagraph7 lang
        ]
    ]


enCloseAirports : Lang -> List (Html msg)
enCloseAirports lang =
    let
        closeOpen s =
            "), "
                ++ s
                ++ " ("

        start =
            Translations.mainAirportSecondParagraph0 lang
                ++ Translations.londonLuton lang
                ++ " ("

        end =
            "), " ++ Translations.etc lang
    in
    [ p [ class "text-justified mb-1" ]
        [ text start
        , a [] [ text <| Translations.wizzAir lang ]
        , text <| closeOpen <| Translations.londonHeathrow lang
        , a [] [ text <| Translations.airSerbia lang ]
        , text <| closeOpen <| Translations.mainAirportSecondParagraph1 lang
        , a [] [ text <| Translations.wizzAir lang ]
        , text ", "
        , a [] [ text <| Translations.easyJet lang ]
        , text ", "
        , a [] [ text <| Translations.airSerbia lang ]
        , text <| closeOpen <| Translations.brussels lang
        , a [] [ text <| Translations.airSerbia lang ]
        , text <| closeOpen <| Translations.eindhoven lang
        , a [] [ text <| Translations.wizzAir lang ]
        , text <| closeOpen <| Translations.luqa lang
        , a [] [ text <| Translations.wizzAir lang ]
        , text <| closeOpen <| Translations.parisBeauvais lang
        , a [] [ text <| Translations.wizzAir lang ]
        , text end
        ]
    ]


planeTravelThirdParagraph : Lang -> Html msg
planeTravelThirdParagraph lang =
    div []
        [ p [ class "text-justified mb-1" ]
            [ text <| Translations.otherAirports lang
            , a [] [ text <| Translations.timisoaraAirport lang ]
            , text <| Translations.romaniaAirportDistance lang
            , a [] [ text <| Translations.budapestAirport lang ]
            , text <|
                Translations.em lang
                    ++ Translations.budapest lang
                    ++ ", "
                    ++ Translations.hungary lang
                    ++ Translations.budapestAirportDistance lang
            , text <| Translations.publicTravelFromAirport lang
            , a [] [ text <| Translations.geaTravel lang ]
            , text "."
            ]
        ]


trainTravel : Lang -> Html msg
trainTravel lang =
    let
        content =
            case lang of
                Translations.Rs ->
                    div []
                        [ p [ class "text-justified mb-1" ]
                            [ text <| Translations.trains0 lang ++ " "
                            , a [ href <| Translations.trainTimetableUrl lang, target "_blank" ]
                                [ text <| Translations.trainTimetable lang ]
                            , text <| "."
                            ]
                        , p [ class "text-justified mb-1" ] [ text <| Translations.trains1 lang ]
                        ]

                _ ->
                    trainTravelText lang
    in
    div [ class Styles.textFont ] [ content ]


trainTravelText : Lang -> Html msg
trainTravelText lang =
    div []
        [ p [ class "text-justified mb-1" ]
            [ text <| Translations.trains0 lang
            , a [ href <| Translations.trainTimetableUrl lang, target "_blank" ] [ text <| Translations.trainTimetable lang ]
            , text <| Translations.trains1 lang
            ]
        , p [ class "text-justified mb-1" ] [ text <| Translations.trains2 lang ]
        ]


busTravel : Lang -> Html msg
busTravel lang =
    let
        content =
            case lang of
                Translations.Rs ->
                    div []
                        [ p [ class "text-justified mb-1" ]
                            [ text <| Translations.bus0 lang
                            , a [ href <| Translations.timetableNoviSadUrl lang, target "_blank" ] [ text <| Translations.timetableNoviSad lang ]
                            , text <| Translations.bus1 lang
                            , a [ href <| Translations.timetableBelgradeUrl lang, target "_blank" ] [ text <| Translations.timetableBelgrade lang ]
                            , text <| Translations.bus2 lang
                            ]
                        , p [ class "text-justified mb-1" ] [ text <| Translations.bus3 lang ]
                        , p [ class "text-justified mb-1" ] [ text <| Translations.bus4 lang ]
                        ]

                _ ->
                    busTravelText lang
    in
    div [ class Styles.textFont ]
        [ content
        ]


busTravelText : Lang -> Html msg
busTravelText lang =
    div []
        [ p [ class "text-justified mb-1" ]
            [ text <|
                Translations.bus0 lang
                    ++ Translations.bus1 lang
                    ++ Translations.bus2 lang
            , a [ href <| Translations.timetableNoviSadUrl lang ]
                [ text <| Translations.timetableNoviSad lang ]
            , text <|
                Translations.bus3 lang
                    ++ Translations.bus4 lang
                    ++ Translations.bus5 lang
                    ++ Translations.bus6 lang
            , a [ href <| Translations.timetableBelgradeUrl lang ]
                [ text <| Translations.timetableBelgrade lang ]
            , text <|
                Translations.bus7 lang
                    ++ Translations.bus8 lang
                    ++ Translations.bus9 lang
            ]
        ]


carTravel : Lang -> Html msg
carTravel lang =
    div [ class Styles.textFont ]
        [ carTravelText lang
        ]


carTravelText : Lang -> Html msg
carTravelText lang =
    div []
        [ p [ class "text-justified mb-1" ]
            [ text <| Translations.car0 lang ]
        , p [ class "text-justified mb-1" ]
            [ text <| Translations.car1 lang ]
        ]


bikeTravel : Lang -> Html msg
bikeTravel lang =
    div [ class Styles.textFont ]
        [ bikeText lang
        ]


bikeText : Lang -> Html msg
bikeText lang =
    div []
        [ p [ class "text-justified mb-1" ] [ text <| Translations.motorbike0 lang ]
        , p [ class "text-justified mb-1" ] [ text <| Translations.motorbike1 lang ]
        ]


walkTravel : Lang -> Html msg
walkTravel lang =
    div [ class Styles.textFont ]
        [ walkText lang
        ]


walkText : Lang -> Html msg
walkText lang =
    div []
        [ p [ class "text-justified mb-1" ]
            [ text <|
                Translations.walkAndSwim0 lang
                    ++ Translations.walkAndSwim1 lang
            ]
        ]


rentalTravel : Lang -> Html msg
rentalTravel lang =
    div [ class Styles.textFont ]
        [ rentalText lang
        ]


rentalText : Lang -> Html msg
rentalText lang =
    div []
        [ p [ class "text-justified mb-1" ]
            [ text <|
                Translations.carRental0 lang
                    ++ Translations.carRental1 lang
            , a [] [ text <| Translations.novaRent lang ]
            , text <|
                Translations.carRental2 lang
                    ++ Translations.carRental3 lang
                    ++ Translations.carRental4 lang
            ]
        ]
