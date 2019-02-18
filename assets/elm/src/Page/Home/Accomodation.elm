module Page.Home.Accomodation exposing (view)

import Html exposing (..)
import Html.Attributes exposing (attribute, class, src, style, type_, classList)
import Html.Events exposing (onClick)
import Styles
import Translations exposing (Lang)
import Page.Home.Types exposing (Model, Msg(..))


view : Lang -> Model -> Html Msg
view lang {activeModal} =    
    div []
        [ div [ class "accomodationGrid", attribute "height" "100%"  ]
            [ div [ class "bookingSquare pointerCursor movable roundCorners boxShadow svg-container p-0-5"]
                [ object [ class "pointerCursor svg-content svg55Pct", type_ "image/svg+xml", attribute "data" "svg/booking.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "kastelSquare pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "kastel"] []
            , div [ class "luxotel pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "luxotel" ] []
            , div [ class "stGeorge pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "stGeorge" ] []
            , div [ class "airbnb pointerCursor movable roundCorners boxShadow svg-container p-0-5" ]
                [ object [ class "svg-content", type_ "image/svg+xml", attribute "data" "svg/airbnb.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "pointerCursor movable roundCorners boxShadow hotelVojvodinaSquare", onClick <| ActivateModal "hotelVojvodina" ] []
            , div [ class "philadelphia pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "philadelphia" ] []
            , div [ class "apartments pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "apartments" ] []
            , div [ class "desktop flowerBL svg-container svgCentered p-0-5" ]
                [ object [ class "desktop svg75Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/flower_bottom_left.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "desktop flowerTL svgCentered svg-container p-0-5" ]
                [ object [ class "desktop svg-content", type_ "image/svg+xml", attribute "data" "svg/flowertopleft.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "accTitle has-text-centered" ]
                [ div [ class "has-text-centered" ] [ header lang ]
                ]
            , div [ class "beeSquare svg-container p-0-5" ]
                [ object [ class "svg90Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/bee.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "bigFlower svgCentered svg-container p-0-5" ]
                [ object [ class "svg90Pct svg-content", style "width" "90%", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "smallFlower svgCentered svg-container p-0-5" ]
                [ object [ class "svg75Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "desktop topRightFlower svgCentered svg-container p-0-5" ]
                [ object [ class "desktop svg-content", type_ "image/svg+xml", attribute "data" "svg/flowertopright.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "mobile smallFlower2 svgCentered svg-container p-0-5" ]
                [ object [ class "mobile svg75Pct svg-content", type_ "image/svg+xml", attribute "data" "svg/single_flower.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            ]
        , viewModal activeModal
        
        
        ]

viewModal activeModal =

    div [classList [("modal", True), ("is-active", (activeModal /= Nothing) )]] [

            div [class "modal-background"] []
            , viewModalContent activeModal
              ,button [ onClick DeactivateModal, class "modal-close is-large", attribute "aria-label" "close"] []

        ]

viewModalContent activeModal =
    let
        content = case activeModal of
            Just "kastel" ->
                modalCard (String.repeat 25 "I am kastel")
        
            Just "luxotel" ->
                modalCard (String.repeat 25 "I am luxotel")
            
            Just "stGeorge" ->
                modalCard (String.repeat 25 "I am stGeorge")
            
            Just "hotelVojvodina" ->
                modalCard (String.repeat 25 "I am Vojvodina")

            Just "philadelphia" ->
                modalCard (String.repeat 25 "I am philadelphia")

            Just "apartments" ->
                modalCard (String.repeat 25 "I am apartments")
            _ ->
                div [][]
    in
           
    div [class "modal-content"] [
               content
            ]

modalCard content =
    div [class "card"] [
        div [class "card-image"] [
            figure [class "image is-4by3"] [
                img [src "https://bulma.io/images/placeholders/1280x960.png"] []
            ]
        ]
        , div [class "card-content"] [
            div [class "media"] [
                div [class "media-left"] [
                    figure [class "image is-48x48"] [
                        img [src "https://bulma.io/images/placeholders/96x96.png"] []
                    ]
                ]
                , div [class "media-content"] [
            p [class "title is-4"][text "John Smith"]
            , p [class "subtitle is-6"] [text "@johnsmith"]
        ]
            ]
        ]
        
        , div [class "content"] [
            text content
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
    div [ class "acc-heading" ]
        [ p [ class Styles.headingFormatting ]
            [ text <| Translations.accomodationTitle lang
            ]
        ]


placeView : ( Lang -> String, Lang -> String ) -> Lang -> Html msg
placeView ( title, description ) lang =
    div []
        [ p [] [ a [] [ text <| title lang ] ]
        , p [] [ text <| description lang ]
        ]
