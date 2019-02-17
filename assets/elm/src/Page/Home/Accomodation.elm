module Page.Home.Accomodation exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, src, type_, attribute, style)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view lang =
    div []
        [ 
            div [class "accomodationGrid"] 
                [ div [class "pointerCursor movable roundCorners boxShadow square1 svg-container p-0-5"] 
                    [object [class "pointerCursor svg-content svg55Pct", type_ "image/svg+xml", attribute "data" "svg/booking.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "pointerCursor movable roundCorners boxShadow kastelSquare"] []
                , div [class "pointerCursor movable roundCorners boxShadow square3"] []
                , div [class "pointerCursor movable roundCorners boxShadow square4"] []
                , div [class "pointerCursor movable roundCorners boxShadow square5 svg-container p-0-5"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "svg/airbnb.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "pointerCursor movable roundCorners boxShadow hotelVojvodinaSquare"] []
                , div [class "pointerCursor movable roundCorners boxShadow square7"] []
                , div [class "pointerCursor movable roundCorners boxShadow square8"] []
                , div [class "pointerCursor movable roundCorners boxShadow square9"] []
                , div [class "flowerBL svg-container svgCentered p-0-5"] [
                    object [ class "svg75Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/flower_bottom_left.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "flowerTL svgCentered svg-container p-0-5"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "svg/flowertopleft.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "pointerCursor movable roundCorners boxShadow square12"] []
                , div [class "accTitle has-text-centered"] [
                    div [ class "has-text-centered" ] [ header lang]
                ]
                , div [class "square14 svg-container p-0-5"] [
                    object [ class "svg90Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/bee.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "bigFlower svgCentered svg-container p-0-5"] [
                    object [ class "svg90Pct svg-content", style "width" "90%", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "smallFlower svgCentered svg-container p-0-5"] [
                    object [ class "svg75Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ] 
                ]
                , div [class "topRightFlower svgCentered svg-container p-0-5"] [
                    object [ class "svg-content", type_ "image/svg+xml", attribute "data" "svg/flowertopright.svg" ] [ text "Your browser does not support SVGs" ] 
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
    div [ class "acc-heading"] [ 
        p [ class Styles.headingFormatting ] [ text <| Translations.accomodationTitle lang
        ]
    ]

         


placeView : ( Lang -> String, Lang -> String ) -> Lang -> Html msg
placeView ( title, description ) lang =
    div []
        [ p [] [ a [] [ text <| title lang ] ]
        , p [] [ text <| description lang ]
        ]

