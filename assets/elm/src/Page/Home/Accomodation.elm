module Page.Home.Accomodation exposing (view)

import Asset
import Html exposing (..)
import Html.Attributes exposing (attribute, class, target, classList, href, src, style, type_)
import Html.Events exposing (onClick)
import Page.Home.Types exposing (Model, Msg(..))
import Styles
import Translations exposing (Lang)


view : Lang -> Model -> Html Msg
view lang { activeModal } =
    div []
        [ div [ class "accomodationGrid", attribute "height" "100%" ]
            [ div [ class "bookingSquare pointerCursor movable roundCorners boxShadow svg-container p-0-5" ]
                [ object [ class "pointerCursor svg-content svg55Pct", type_ "image/svg+xml", attribute "data" "svg/booking.svg" ] [ text "Your browser does not support SVGs" ]
                ]
            , div [ class "kastelSquare pointerCursor movable roundCorners boxShadow", onClick <| ActivateModal "kastel" ] []
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
        , viewModal lang activeModal
        ]



viewModal lang activeModal =
    div [ classList [ ( "modal", True ), ( "is-active", activeModal /= Nothing )] ]
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
                            Asset.src Asset.kastel

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.threeDollar lang

                        distance =
                            "This is our venue!"
                    in
                    modalCard title description imageSource websiteLink cost distance

                Just "luxotel" ->
                    let
                        title =
                            Translations.luxotel lang

                        description =
                            [ Translations.luxotelDesc lang ]

                        imageSource =
                            Asset.src Asset.luxotel

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.oneDollar lang
                    in
                    modalCard title description imageSource websiteLink cost "This is our venue!"

                Just "stGeorge" ->
                    let
                        title =
                            Translations.apartments lang

                        description =
                            [ Translations.apartmentsDesc lang ]

                        imageSource =
                            Asset.src Asset.stGeorge

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.oneDollar lang
                    in
                    modalCard title description imageSource websiteLink cost "This is our venue!"

                Just "hotelVojvodina" ->
                    let
                        title =
                            Translations.hotelVojvodina lang

                        description =
                            [ Translations.hotelVojvodinaDesc lang ]

                        imageSource =
                            Asset.src Asset.hotelVojvodina

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.oneDollar lang
                    in
                    modalCard title description imageSource websiteLink cost "This is our venue!"

                Just "philadelphia" ->
                    let
                        title =
                            Translations.villa lang

                        description =
                            [ Translations.villaDesc lang ]

                        imageSource =
                            Asset.src Asset.philadelphia

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.oneDollar lang
                    in
                    modalCard title description imageSource websiteLink cost "This is our venue!"

                Just "apartments" ->
                    let
                        title =
                            Translations.apartmani lang

                        description =
                            [ Translations.apartmaniDesc lang ]

                        imageSource =
                            Asset.src Asset.apartments

                        websiteLink =
                            Translations.kastelWebsite lang

                        cost =
                            Translations.oneDollar lang
                    in
                    modalCard title description imageSource websiteLink cost "This is our venue!"

                _ ->
                    div [] []
    in
    div [ class "modal-content" ]
        [ content
        ]


modalCard title content imageSource websiteLink cost distance =
    div [ class "card" ]
        [ div [ class "card-image" ]
            [ figure [ class "image is-4by3" ]
                [ img [ imageSource ] []
                ]
            ]
        , div [ class "card-content" ]
            [ div [ class "media" ]
                [ div [ class "media-content" ]
                    [ p [ class "title is-1 font-amatic" ] [ text <| title ]
                    ]
                , div [ class "media-right" ]
                    [ p [class "font-text is-size-5 modalP"] [ text <| distance ]
                    , p [ class " modalP has-text-right is-size-5 dollars font-text" ] [ text <| cost ]
                    ]
                ]
            ]
        , div [ class "content modalContentPadding" ]
            (List.map (\descLine -> div [class "font-text is-size-5"] [ text descLine ]) content)
        , div [ class "has-text-centered modalContentPadding pb-24"]
            [ a [ href websiteLink,
            target "_blank", class "modalButton font-text is-size-5 slightlyLessMovable" ] [ 
                i [class "fas fa-globe-americas pr-6"] []
                , text <| "Website" ]
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
