module Page.Home.Poem exposing (viewPoem1, viewPoem2, viewPoem3)

import Html exposing (..)
import Html.Attributes exposing (class)
import Styles
import Translations



-- Helpers


firstParagraph : Translations.Lang -> Html msg
firstParagraph lang =
    p [ class Styles.textFont ]
        ([ Translations.ourStory0
         , Translations.ourStory1
         , Translations.ourStory2
         , Translations.ourStory3
         , Translations.ourStory4
         ]
            |> List.map (toText lang)
            |> List.intersperse (br [] [])
        )


secondParagraph : Translations.Lang -> Html msg
secondParagraph lang =
    p [ class Styles.textFont ]
        ([ Translations.ourStory5
         , Translations.ourStory6
         ]
            |> List.map (toText lang)
            |> List.intersperse (br [] [])
        )


thirdParagraph : Translations.Lang -> Html msg
thirdParagraph lang =
    p [ class Styles.textFont ]
        ([ Translations.ourStory7
         , Translations.ourStory8
         , Translations.ourStory9
         , Translations.ourStory10
         ]
            |> List.map (toText lang)
            |> List.intersperse (br [] [])
        )


fourthParagraph : Translations.Lang -> Html msg
fourthParagraph lang =
    p [ class Styles.textFont ]
        ([ Translations.ourStory11
         , Translations.ourStory12
         , Translations.ourStory13
         , Translations.ourStory14
         , Translations.ourStory15
         ]
            |> List.map (toText lang)
            |> List.intersperse (br [] [])
        )


fifthParagraph : Translations.Lang -> Html msg
fifthParagraph lang =
    p [ class Styles.textFont ]
        [ text <| Translations.ourStory16 lang
        ]


sixthParagraph : Translations.Lang -> Html msg
sixthParagraph lang =
    p [ class Styles.textFont ]
        ([ Translations.ourStory17
         , Translations.ourStory18
         , Translations.ourStory19
         , Translations.ourStory20
         ]
            |> List.map (toText lang)
            |> List.intersperse (br [] [])
        )


seventhParagraph : Translations.Lang -> Html msg
seventhParagraph lang =
    p [ class Styles.textFont ]
        ([ Translations.ourStory21
         , Translations.ourStory22
         , Translations.ourStory23
         , Translations.ourStory24
         , Translations.ourStory25
         , Translations.ourStory26
         , Translations.ourStory27
         ]
            |> List.map (toText lang)
            |> List.intersperse (br [] [])
        )


eighthParagraph : Translations.Lang -> Html msg
eighthParagraph lang =
    p [ class Styles.textFont ]
        [ text <| Translations.ourStory28 lang
        ]


ninethParagraph : Translations.Lang -> Html msg
ninethParagraph lang =
    p [ class Styles.textFont ]
        [ text <| Translations.ourStory29 lang
        ]


toText : Translations.Lang -> (Translations.Lang -> String) -> Html msg
toText lang verse =
    lang |> verse |> text



-- View


viewPoem1 : Translations.Lang -> Html msg
viewPoem1 lang =
    p []
        ([ firstParagraph
         , secondParagraph
         , thirdParagraph
         ]
            |> List.map (\function -> function lang)
            |> List.intersperse (br [] [])
        )


viewPoem2 : Translations.Lang -> Html msg
viewPoem2 lang =
    p []
        ([ fourthParagraph
         , fifthParagraph
         , sixthParagraph
         ]
            |> List.map (\function -> function lang)
            |> List.intersperse (br [] [])
        )


viewPoem3 : Translations.Lang -> Html msg
viewPoem3 lang =
    p []
        ([ seventhParagraph
         , eighthParagraph
         , ninethParagraph
         ]
            |> List.map (\function -> function lang)
            |> List.intersperse (br [] [])
        )
