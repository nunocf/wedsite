module OurStorySection exposing (view)

import Html exposing (Html, br, div, h1, img, p, section, span, text)
import Html.Attributes exposing (class, id, src)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import Styles
import Translations exposing (Lang)


view : Lang -> Bool -> Html Msg
view language showFullPoem =
    div [ class Styles.ourStory ]
        [ div [ class "container mb-2" ]
            [ div [ class "has-text-centered" ]
                [ header language
                ]
            , div [ class "ourStoryContainer" ]
                [ div [] [ poem1 language ]
                , div [ class "is-hidden-mobile" ]
                    [ img [ src "https://via.placeholder.com/600x450" ] [] ]
                , div [] [ poem2 language ]
                , div [] [ poem3 language ]
                ]

            -- , div [ class "columns is-centered" ]
            --     [ div [ class "column" ]
            --         [ content language showFullPoem
            --         ]
            --     , div [ class "column" ]
            --         [ div [ class "is-hidden-mobile" ]
            --             [
            --             ]
            --         ]
            --     ]
            ]

        -- , div [ class "container" ]
        --     [ div [ class "columns is-centered" ]
        --         [ div [ class "column" ]
        --             [ showPoemThirdSection showFullPoem language
        --             ]
        --         , div [ class "column" ]
        --             [ showPoemSecondSection showFullPoem language
        --             ]
        --         ]
        --     ]
        ]


poem2 : Lang -> Html msg
poem2 lang =
    p []
        ([ fourthParagraph
         , fifthParagraph
         , sixthParagraph
         ]
            |> List.map (\function -> function lang)
            |> List.intersperse (br [] [])
        )


poem3 : Lang -> Html msg
poem3 lang =
    p []
        ([ seventhParagraph
         , eighthParagraph
         , ninethParagraph
         ]
            |> List.map (\function -> function lang)
            |> List.intersperse (br [] [])
        )



-- showPoemThirdSection : Bool -> Lang -> Html Msg
-- showPoemThirdSection showPoem lang =
--     let
--         contentList =
--             if showPoem then
--                 [ --      firstParagraph
--                   -- , secondParagraph
--                   -- , thirdParagraph
--                   fourthParagraph
--                 , fifthParagraph
--                 , sixthParagraph
--                 , readMoreContent
--                 ]
--             else
--                 [ --     firstParagraph
--                   -- , secondParagraph
--                   -- , thirdParagraph
--                   fourthParagraph
--                 , fifthParagraph
--                 , sixthParagraph
--                 , readMoreIndicator
--                 ]
--     in
--     p [ class "font-text-size" ]
--         (contentList
--             |> List.map (\function -> function lang)
--             |> List.intersperse (br [] [])
--         )
-- content : Lang -> Bool -> Html Msg
-- content lang showFullPoem =
--     let
--         showMore =
--             case showFullPoem of
--                 True ->
--                     div [] []
--                 False ->
--                     showMoreButton lang
--     in
--     div []
--         [ poem lang showFullPoem
--         , showMore
--         ]
-- showMoreButton : Lang -> Html Msg
-- showMoreButton lang =
--     div
--         [ class "is-hidden-desktop"
--         , onClick <| Msg.ShowPoem True
--         ]
--         [ text <| Translations.showMore lang ]
-- showLessButton : Lang -> Html Msg
-- showLessButton lang =
--     div
--         [ class "is-hidden-desktop"
--         , onClick <| Msg.ShowPoem False
--         ]
--         [ text <| Translations.showLess lang ]
-- showPoemSecondSection : Bool -> Lang -> Html Msg
-- showPoemSecondSection showSection lang =
--     let
--         contentList =
--             case showSection of
--                 True ->
--                     [ seventhParagraph
--                     , eighthParagraph
--                     , ninethParagraph
--                     , showLessButton
--                     ]
--                 False ->
--                     []
--     in
--     p [ class "vab" ]
--         (contentList
--             |> List.map (\function -> function lang)
--             |> List.intersperse (br [] [])
--         )


header : Lang -> Html msg
header language =
    h1 [ class Styles.headingFormatting ]
        [ text <| Translations.ourStoryTitle language
        ]


poem1 : Lang -> Html msg
poem1 language =
    p []
        ([ firstParagraph
         , secondParagraph
         , thirdParagraph
         ]
            |> List.map (\function -> function language)
            |> List.intersperse (br [] [])
        )



-- readMoreIndicator : Lang -> Html msg
-- readMoreIndicator language =
--     span [ id "dots" ] [ text "..." ]
-- readMoreContent : Lang -> Html msg
-- readMoreContent language =
--     span [ id "more" ]
--         ([]
--             |> List.map (\function -> function language)
--             |> List.intersperse (br [] [])
--         )


firstParagraph : Lang -> Html msg
firstParagraph language =
    p [ class Styles.textFont ]
        ([ text <| Translations.ourStory0 language
         , text <| Translations.ourStory1 language
         , text <| Translations.ourStory2 language
         , text <| Translations.ourStory3 language
         , text <| Translations.ourStory4 language
         ]
            |> List.intersperse (br [] [])
        )


secondParagraph : Lang -> Html msg
secondParagraph language =
    p [ class Styles.textFont ]
        ([ text <| Translations.ourStory5 language
         , text <| Translations.ourStory6 language
         ]
            |> List.intersperse (br [] [])
        )


thirdParagraph : Lang -> Html msg
thirdParagraph language =
    p [ class Styles.textFont ]
        ([ text <| Translations.ourStory7 language
         , text <| Translations.ourStory8 language
         , text <| Translations.ourStory9 language
         , text <| Translations.ourStory10 language
         ]
            |> List.intersperse (br [] [])
        )


fourthParagraph : Lang -> Html msg
fourthParagraph language =
    p [ class Styles.textFont ]
        ([ text <| Translations.ourStory11 language
         , text <| Translations.ourStory12 language
         , text <| Translations.ourStory13 language
         , text <| Translations.ourStory14 language
         , text <| Translations.ourStory15 language
         ]
            |> List.intersperse (br [] [])
        )


fifthParagraph : Lang -> Html msg
fifthParagraph language =
    p [ class Styles.textFont ]
        [ text <| Translations.ourStory16 language
        ]


sixthParagraph : Lang -> Html msg
sixthParagraph language =
    p [ class Styles.textFont ]
        ([ text <| Translations.ourStory17 language
         , text <| Translations.ourStory18 language
         , text <| Translations.ourStory19 language
         , text <| Translations.ourStory20 language
         ]
            |> List.intersperse (br [] [])
        )


seventhParagraph : Lang -> Html msg
seventhParagraph language =
    p [ class Styles.textFont ]
        ([ text <| Translations.ourStory21 language
         , text <| Translations.ourStory22 language
         , text <| Translations.ourStory23 language
         , text <| Translations.ourStory24 language
         , text <| Translations.ourStory25 language
         , text <| Translations.ourStory26 language
         , text <| Translations.ourStory27 language
         ]
            |> List.intersperse (br [] [])
        )


eighthParagraph : Lang -> Html msg
eighthParagraph language =
    p [ class Styles.textFont ]
        [ text <| Translations.ourStory28 language
        ]


ninethParagraph : Lang -> Html msg
ninethParagraph language =
    p [ class Styles.textFont ]
        [ text <| Translations.ourStory29 language
        ]
