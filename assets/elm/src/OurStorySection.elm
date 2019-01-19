module OurStorySection exposing (view)

import Html exposing (Html, br, div, h1, p, section, text)
import Html.Attributes exposing (class)
import Styles
import Translations exposing (Lang)


view : Lang -> Html msg
view language =
    div [ class Styles.ourStory ]
        [ header language
        , poem language
        ]


header : Lang -> Html msg
header language =
    h1 [ class "title is-1 has-text-weight-semibold font-penna has-text-white has-text-centered" ]
        [ text <| Translations.ourStoryTitle language
        ]


poem : Lang -> Html msg
poem language =
    div [ class "has-text-white has-text-centered" ]
        ([ firstParagraph
         , secondParagraph
         , thirdParagraph
         , fourthParagraph
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
         ]
            |> List.intersperse (br [] [])
        )


secondParagraph : Lang -> Html msg
secondParagraph language =
    p []
        [ text <| Translations.ourStory4 language
        ]


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
