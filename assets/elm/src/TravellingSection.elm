module TravellingSection exposing (view)

import Html exposing (Html, a, div, p, text)
import Html.Attributes exposing (class)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view lang =
    div [ class Styles.travellingSection ]
        [ div [ class "container" ]
            [ div [ class "columns is-centered" ]
                [ div [ class "column is-two-thirds-desktop" ]
                    [ content lang
                    ]
                ]
            ]
        ]


content : Lang -> Html msg
content lang =
    div [ class "notification" ]
        [ div [ class "columns is-centered" ]
            [ div [ class "column is-three-quarters-desktop" ]
                [ header lang
                , planeTravel lang
                , trainTravel lang
                , busTravel lang
                , carTravel lang
                , bikeTravel lang
                , walkTravel lang
                , rentalTravel lang
                ]
            ]
        ]


header : Lang -> Html msg
header lang =
    div []
        [ p [ class "title has-text-weight-semi-bold is-size-1 font-penna" ]
            [ text <| Translations.travellingHeader lang
            ]
        , p [ class "subtitle is-size-5" ]
            [ text <|
                Translations.travellingSubtitle0 lang
                    ++ Translations.coordinates lang
                    ++ Translations.travellingSubtitle1 lang
            ]
        ]


planeTravel : Lang -> Html msg
planeTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.airplane lang ]
        , planeTravelText lang
        ]


planeTravelText : Lang -> Html msg
planeTravelText lang =
    div []
        [ planeTravelFirstParagraph lang
        , planeTravelSecondParagraph lang
        , planeTravelThirdParagraph lang
        ]


planeTravelFirstParagraph : Lang -> Html msg
planeTravelFirstParagraph lang =
    p []
        [ [ Translations.mainAirport0
          , Translations.belgradeAirport
          , Translations.mainAirport1
          ]
            |> List.map (\fn -> fn lang)
            |> String.join " "
            |> text
        ]


planeTravelSecondParagraph : Lang -> Html msg
planeTravelSecondParagraph lang =
    let
        closeOpen s =
            "), "
                ++ s
                ++ "("

        start =
            Translations.mainAirportSecondParagraph0 lang
                ++ Translations.londonLuton lang
                ++ "("

        end =
            "), " ++ Translations.etc lang
    in
    p
        []
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


planeTravelThirdParagraph : Lang -> Html msg
planeTravelThirdParagraph lang =
    div []
        [ p []
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
            ]
        ]


trainTravel : Lang -> Html msg
trainTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.trainsTitle lang ]
        , trainTravelText lang
        ]


trainTravelText : Lang -> Html msg
trainTravelText lang =
    div []
        [ p [] [ text <| Translations.trains0 lang ++ Translations.trains1 lang ]
        ]


busTravel : Lang -> Html msg
busTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.busTitle lang ]
        , busTravelText lang
        ]


busTravelText : Lang -> Html msg
busTravelText lang =
    div []
        [ p []
            [ text <|
                Translations.bus0 lang
                    ++ Translations.bus1 lang
                    ++ Translations.bus2 lang
            , a [] [ text <| Translations.timetable lang ]
            , text <|
                Translations.bus3 lang
                    ++ Translations.bus4 lang
                    ++ Translations.bus5 lang
                    ++ Translations.bus6 lang
            , a [] [ text <| Translations.timetable lang ]
            , text <|
                Translations.bus7 lang
                    ++ Translations.bus8 lang
                    ++ Translations.bus9 lang
            ]
        ]


carTravel : Lang -> Html msg
carTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.carTitle lang ]
        , carTravelText lang
        ]


carTravelText : Lang -> Html msg
carTravelText lang =
    div []
        [ p []
            [ text <|
                Translations.car0 lang
                    ++ Translations.car1 lang
            ]
        ]


bikeTravel : Lang -> Html msg
bikeTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.motorbikeTitle lang ]
        , bikeText lang
        ]


bikeText : Lang -> Html msg
bikeText lang =
    div []
        [ p []
            [ text <|
                Translations.motorbike0 lang
                    ++ Translations.motorbike1 lang
                    ++ Translations.motorbike2 lang
            ]
        ]


walkTravel : Lang -> Html msg
walkTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.walkAndSwimTitle lang ]
        , walkText lang
        ]


walkText : Lang -> Html msg
walkText lang =
    div []
        [ p []
            [ text <|
                Translations.walkAndSwim0 lang
                    ++ Translations.walkAndSwim1 lang
            ]
        ]


rentalTravel : Lang -> Html msg
rentalTravel lang =
    div []
        [ p [ class Styles.transportSubtitle ] [ text <| Translations.carRentalTitle lang ]
        , rentalText lang
        ]


rentalText : Lang -> Html msg
rentalText lang =
    div []
        [ p []
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
