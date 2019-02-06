module AccomodationSection exposing (view)

import Html exposing (Html, a, div, p, text)
import Html.Attributes exposing (class)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view lang =
    div [ class Styles.accomodationSection ]
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
                ([ header lang ]
                    ++ ([ ( Translations.dvoracKastel, Translations.dvoracKastelDesc )
                        , ( Translations.hotelVojvodina, Translations.hotelVojvodinaDesc )
                        , ( Translations.luxotel, Translations.luxotelDesc )
                        ]
                            |> List.map (\t -> placeView t lang)
                       )
                    ++ [ p [] [ text <| Translations.accomodationFinal lang ] ]
                    ++ ([ ( Translations.apartments, Translations.apartmentsDesc )
                        , ( Translations.villa, Translations.villaDesc )
                        , ( Translations.airbnb, Translations.airbnbDesc )
                        , ( Translations.booking, Translations.bookingDesc )
                        , ( Translations.limba, Translations.limbaDesc )
                        , ( Translations.apartmani, Translations.apartmaniDesc )
                        ]
                            |> List.map (\t -> placeView t lang)
                       )
                )
            ]
        ]


header : Lang -> Html msg
header lang =
    div []
        [ p [ class "title has-text-weight-semi-bold is-size-1 font-heading" ]
            [ text <| Translations.accomodationTitle lang
            ]
        , p [ class "subtitle is-size-5" ]
            [ text <| Translations.accomodationDesc lang
            ]
        ]


placeView : ( Lang -> String, Lang -> String ) -> Lang -> Html msg
placeView ( title, description ) lang =
    div []
        [ p [] [ a [] [ text <| title lang ] ]
        , p [] [ text <| description lang ]
        ]
