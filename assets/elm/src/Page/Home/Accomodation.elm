module Page.Home.Accomodation exposing (view)

import Asset
import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, src, style, target, type_)
import Html.Events exposing (onClick)
import Page.Home.Types exposing (Model, Msg(..))
import Styles
import Translations exposing (Lang)


view : Lang -> Model -> Html Msg
view lang { activeModal } =
    div []
        [ div [ class "accomodationGrid", attribute "height" "100%" ]
            [ a [ href "https://www.booking.com", target "_blank", class "bookingSquare pointerCursor movable roundCorners boxShadow svg-container p-0-5" ]
                [ object [ class "pointerCursor svg-content svg55Pct", type_ "image/svg+xml", attribute "data" "svg/booking.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "kastelSquare kastelBG pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "kastel" ] []
            , div [ class "luxotel luxotelBG pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "luxotel" ] []
            , div [ class "stGeorge stGeorgeBG pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "stGeorge" ] []
            , a [ href "https://www.airbnb.com", target "_blank", class "airbnb pointerCursor movable roundCorners boxShadow svg-container p-0-5" ]
                [ object [ class "pointerCursor svg-content", type_ "image/svg+xml", attribute "data" "svg/airbnb.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "hotelVojvodinaSquare hotelVojvodinaBG pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "hotelVojvodina" ] []
            , div [ class "philadelphia philadelphiaBG pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "philadelphia" ] []
            , div [ class "apartments apartmentsBG pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "apartments" ] []
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
        , viewModal lang activeModal
        ]


viewModal lang activeModal =
    div [ classList [ ( "modal", True ), ( "is-active", activeModal /= Nothing ) ] ]
        [ div [ class "modal-background", onClick DeactivateModal ] []
        , viewModalContent lang activeModal
        , button [ onClick DeactivateModal, class "modal-close is-large", attribute "aria-label" "close" ] []
        ]


viewModalContent lang activeModal =
    let
        content =
            case activeModal of
                Just "kastel" ->
                    let
                        title =
                            Translations.dvoracKastel lang

                        description =
                            [ Translations.dvoracKastelDesc0 lang, Translations.dvoracKastelDesc1 lang ]

                        imageSource =
                            "kastelBG"

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.highPrice lang

                        distance =
                            Translations.dvoracKastelDist lang
                    in
                    modalCard title description imageSource websiteLink cost distance

                Just "luxotel" ->
                    let
                        title =
                            Translations.luxotel lang

                        description =
                            [ Translations.luxotelDesc0 lang, Translations.luxotelDesc1 lang ]

                        imageSource =
                            "luxotelBG"

                        websiteLink =
                            Translations.luxotelWebsite lang

                        cost =
                            Translations.mediumPrice lang

                        distance =
                            Translations.luxotelDist lang
                    in
                    modalCard title description imageSource websiteLink cost distance

                Just "stGeorge" ->
                    let
                        title =
                            Translations.apartments lang

                        description =
                            [ Translations.apartmentsDesc0 lang, Translations.apartmentsDesc1 lang ]

                        imageSource =
                            "stGeorgeBG"

                        websiteLink =
                            Translations.apartmentsWebsite lang

                        cost =
                            Translations.mediumPrice lang

                        distance =
                            Translations.apartmentsDist lang
                    in
                    modalCard title description imageSource websiteLink cost distance

                Just "hotelVojvodina" ->
                    let
                        title =
                            Translations.hotelVojvodina lang

                        description =
                            [ Translations.hotelVojvodinaDesc0 lang, Translations.hotelVojvodinaDesc1 lang ]

                        imageSource =
                            "hotelVojvodinaBG"

                        websiteLink =
                            Translations.hotelVojvodinaWebsite lang

                        cost =
                            Translations.highPrice lang

                        distance =
                            Translations.hotelVojvodinaDist lang
                    in
                    modalCard title description imageSource websiteLink cost distance

                Just "philadelphia" ->
                    let
                        title =
                            Translations.villa lang

                        description =
                            [ Translations.villaDesc0 lang ]

                        imageSource =
                            "philadelphiaBG"

                        websiteLink =
                            Translations.villaWebsite lang

                        cost =
                            Translations.lowPrice lang

                        distance =
                            Translations.villaDist lang
                    in
                    modalCard title description imageSource websiteLink cost distance

                Just "apartments" ->
                    let
                        title =
                            Translations.apartmani lang

                        description =
                            [ Translations.apartmaniDesc0 lang, Translations.apartmaniDesc1 lang ]

                        imageSource =
                            "apartmentsBG"

                        websiteLink =
                            Translations.apartmaniWebsite lang

                        cost =
                            Translations.lowPrice lang

                        distance =
                            Translations.apartmeniDist lang
                    in
                    modalCard title description imageSource websiteLink cost distance

                _ ->
                    div [] []
    in
    div [ class "modal-content" ]
        [ content
        ]


modalCard title content imageSource websiteLink cost distance =
    div [ class "card" ]
        [ div [ class "card-image" ]
            [ figure [ class ("image is-4by3 " ++ imageSource) ]
                [-- img [ imageSource ] []
                ]
            ]
        , div [ class "card-content" ]
            [ div [ class "media" ]
                [ div [ class "media-content" ]
                    [ p [ class "title is-1 font-amatic" ] [ text <| title ]
                    ]
                , div [ class "media-right" ]
                    [ p [ class "font-text is-size-5 modalP" ] [ text <| distance ]
                    , p [ class " modalP has-text-right is-size-5 dollars font-text" ] [ text <| cost ]
                    ]
                ]
            ]
        , div [ class "content modalContentPadding" ]
            (List.map (\descLine -> div [ class "font-text is-size-5" ] [ text descLine ]) content)
        , div [ class "has-text-centered modalContentPadding pb-24" ]
            [ a
                [ href websiteLink
                , target "_blank"
                , class Styles.modalButton
                ]
                [ i [ class "fas fa-globe-americas pr-6" ] []
                , text <| "Website"
                ]
            ]
        ]


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
