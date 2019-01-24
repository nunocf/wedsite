module OurStorySection exposing (view)

import Html exposing (Html, br, div, h1, p, section, span, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import Styles
import Translations exposing (Lang)


view : Lang -> Bool -> Html Msg
view language showFullPoem =
    div [ class Styles.ourStory ]
        [ div [ class "container" ]
            [ div [ class "columns is-centered" ]
                [ div [ class "column is-two-thirds-desktop" ]
                    [ content language showFullPoem
                    ]
                ]
            ]
        ]


content : Lang -> Bool -> Html Msg
content language showFullPoem =
    let
        showAllText =
            if showFullPoem then
                "Show less"

            else
                "Show more"
    in
    div [ class "notification" ]
        [ div [ class "columns is-centered" ]
            [ div [ class "column is-three-quarters-desktop" ]
                [ header language
                , poem language showFullPoem
                , div [ onClick <| Msg.ShowPoem (not showFullPoem) ] [ text showAllText ]
                ]
            ]
        ]


header : Lang -> Html msg
header language =
    p [ class "title has-text-weight-semibold is-size-1 font-penna" ]
        [ text <| Translations.ourStoryTitle language
        ]


poem : Lang -> Bool -> Html msg
poem language show =
    let
        contentList =
            if show then
                [ firstParagraph

                -- , secondParagraph
                , thirdParagraph
                , readMoreContent
                ]

            else
                [ firstParagraph

                -- , secondParagraph
                , thirdParagraph
                , readMoreIndicator
                ]
    in
    p [ class "is-size-5" ]
        (contentList
            |> List.map (\function -> function language)
            |> List.intersperse (br [] [])
        )


readMoreIndicator : Lang -> Html msg
readMoreIndicator language =
    span [ id "dots" ] [ text "..." ]


readMoreContent : Lang -> Html msg
readMoreContent language =
    span [ id "more" ]
        ([ fourthParagraph
         , fifthParagraph
         , sixthParagraph
         , seventhParagraph
         , eighthParagraph
         , ninethParagraph
         ]
            |> List.map (\function -> function language)
            |> List.intersperse (br [] [])
        )


firstParagraph : Lang -> Html msg
firstParagraph language =
    p []
        ([ text <| Translations.ourStory0 language
         , text <| Translations.ourStory1 language
         , text <| Translations.ourStory2 language
         , text <| Translations.ourStory3 language
         , text <| Translations.ourStory4 language
         ]
            |> List.intersperse (br [] [])
        )



-- secondParagraph : Lang -> Html msg
-- secondParagraph language =
--     p []
--         [ text <| Translations.ourStory4 language
--         ]


thirdParagraph : Lang -> Html msg
thirdParagraph language =
    p []
        ([ text <| Translations.ourStory5 language
         , text <| Translations.ourStory6 language
         , text <| Translations.ourStory7 language
         ]
            |> List.intersperse (br [] [])
        )


fourthParagraph : Lang -> Html msg
fourthParagraph language =
    p []
        ([ text <| Translations.ourStory8 language
         , text <| Translations.ourStory9 language
         , text <| Translations.ourStory10 language
         , text <| Translations.ourStory11 language
         , text <| Translations.ourStory12 language
         ]
            |> List.intersperse (br [] [])
        )


fifthParagraph : Lang -> Html msg
fifthParagraph language =
    p []
        [ text <| Translations.ourStory13 language
        ]


sixthParagraph : Lang -> Html msg
sixthParagraph language =
    p []
        ([ text <| Translations.ourStory14 language
         , text <| Translations.ourStory15 language
         , text <| Translations.ourStory16 language
         ]
            |> List.intersperse (br [] [])
        )


seventhParagraph : Lang -> Html msg
seventhParagraph language =
    p []
        ([ text <| Translations.ourStory17 language
         , text <| Translations.ourStory18 language
         , text <| Translations.ourStory19 language
         , text <| Translations.ourStory20 language
         , text <| Translations.ourStory21 language
         , text <| Translations.ourStory22 language
         ]
            |> List.intersperse (br [] [])
        )


eighthParagraph : Lang -> Html msg
eighthParagraph language =
    p []
        [ text <| Translations.ourStory23 language
        ]


ninethParagraph : Lang -> Html msg
ninethParagraph language =
    p []
        [ text <| Translations.ourStory24 language
        ]
