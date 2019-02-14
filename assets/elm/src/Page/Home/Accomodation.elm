module Page.Home.Accomodation exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, src, type_, attribute, style)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view lang =
    div []
        [ 
            div [class "accomodationContainer"] 
                [ div [class "roundCorners boxShadow square1 svg-container"] 
                    [object [class "svg-content", style "width" "55%", type_ "image/svg+xml", attribute "data" "images/booking.svg" ] [ text "Your browser does not support SVGs" ] 
                        
                ]
                , div [class "roundCorners boxShadow kastelSquare"] []
                , div [class "roundCorners boxShadow square3"] []
                , div [class "roundCorners boxShadow square4"] []
                , div [class "roundCorners boxShadow square5 svg-container"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "images/airbnb.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "roundCorners boxShadow hotelVojvodinaSquare"] []
                , div [class "roundCorners boxShadow square7"] []
                , div [class "roundCorners boxShadow square8"] []
                , div [class "roundCorners boxShadow square9"] []
                , div [class "flowerBL svg-container svgCentered"] [
                    object [ style "width" "75%", class "svg-content", type_ "image/svg+xml", attribute "data" "images/flower_bottom_left.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "flowerTL svgCentered svg-container p-0-5"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "images/flowertopleft.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "roundCorners boxShadow square12"] []
                , div [class "roundCorners boxShadow square13"] [header lang]
                , div [class "square14 svg-container p-0-5"] [
                    object [ style "width" "90%", class "svg-content", type_ "image/svg+xml", attribute "data" "images/bee.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "bigFlower svgCentered svg-container p-0-5"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "images/single_flower.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "smallFlower svgCentered svg-container p-0-5"] [
                    object [ style "width" "75%", class "svg-content", type_ "image/svg+xml", attribute "data" "images/single_flower.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "topRightFlower svgCentered svg-container p-0-5"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "images/flowertopright.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                ]
        ]

        
            -- ++ ([ ( Translations.dvoracKastel, Translations.dvoracKastelDesc )
            --     , ( Translations.hotelVojvodina, Translations.hotelVojvodinaDesc )
            --     , ( Translations.luxotel, Translations.luxotelDesc )
            --     ]
            --         |> List.map (\t -> placeView t lang)
            --     )
            -- ++ [ p [] [ text <| Translations.accomodationFinal lang ] ]
            -- ++ ([ ( Translations.apartments, Translations.apartmentsDesc )
            --     , ( Translations.villa, Translations.villaDesc )
            --     , ( Translations.airbnb, Translations.airbnbDesc )
            --     , ( Translations.booking, Translations.bookingDesc )
            --     , ( Translations.limba, Translations.limbaDesc )
            --     , ( Translations.apartmani, Translations.apartmaniDesc )
            --     ]
            --         |> List.map (\t -> placeView t lang)
            --     )
        -- )
    
        


header : Lang -> Html msg
header lang =
    div []
        [ p [ class "title has-text-weight-semi-bold is-size-1 font-heading" ]
            [ text <| Translations.accomodationTitle lang
            ]
        ]


placeView : ( Lang -> String, Lang -> String ) -> Lang -> Html msg
placeView ( title, description ) lang =
    div []
        [ p [] [ a [] [ text <| title lang ] ]
        , p [] [ text <| description lang ]
        ]

