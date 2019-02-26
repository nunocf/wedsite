module Page.Rsvp.PinCode exposing (PinCode, emptyPinCode, isValid, onBackspace, pinCodeToString, update)

import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (keyCode, on, onClick, onInput)
import Json.Decode as Json


type alias PinCode =
    Dict Int (Maybe String)


emptyPinCode =
    [ ( 0, Nothing )
    , ( 1, Nothing )
    , ( 3, Nothing )
    , ( 4, Nothing )
    ]
        |> Dict.fromList


pinCodeToString : PinCode -> Maybe String
pinCodeToString pinCode =
    if isValid pinCode then
        Just <|
            Dict.foldl
                (\_ val acc ->
                    case val of
                        Just v ->
                            acc ++ v

                        Nothing ->
                            acc
                )
                ""
                pinCode

    else
        Nothing


update : Int -> String -> PinCode -> PinCode
update index value pinCode =
    case value of
        "" ->
            Dict.insert index Nothing pinCode

        _ ->
            Dict.insert index (Just value) pinCode


isValid : PinCode -> Bool
isValid =
    Dict.toList
        >> List.filterMap (Tuple.second >> identity)
        >> (List.length >> (==) 4)


onBackspace : msg -> Attribute msg
onBackspace msg =
    let
        tagger key =
            case key of
                8 ->
                    Json.succeed msg

                _ ->
                    Json.fail "not handling this key"
    in
    on "keyup" (Json.andThen tagger keyCode)


view : String -> (Int -> String -> msg) -> (Int -> msg) -> Bool -> PinCode -> Html msg
view descriptionEnterCode inputMsg backspaceMsg isDisabled pinCode =
    div
        [ classList
            [ ( "PinContainer", True )
            , ( "ClearFix", True )
            ]
        ]
        (List.range 0 3
            |> List.map (pinInput descriptionEnterCode inputMsg backspaceMsg isDisabled pinCode)
        )


pinInput : String -> (Int -> String -> msg) -> (Int -> msg) -> Bool -> PinCode -> Int -> Html msg
pinInput descriptionEnterCode inputMsg backspaceMsg isDisabled pinCode index =
    let
        value_ =
            pinCode
                |> Dict.get index
                |> Maybe.withDefault Nothing
    in
    input
        [ type_ "tel"
        , attribute "pattern" "[0-9]*"
        , classList
            [ ( "TextInput", True )
            , ( "PinInputLeft", index == 0 )
            , ( "PinInputMiddle", index == 1 || index == 2 )
            , ( "PinInputRight", index == 3 )
            ]
        , onInput (inputMsg index)
        , onBackspace (backspaceMsg index)
        , attribute "id" ("pin-code-" ++ String.fromInt index)
        , attribute "data-cy" ("pinCode" ++ String.fromInt index)
        , maxlength 1
        , disabled isDisabled
        , attribute "aria-label" descriptionEnterCode
        , value <| Maybe.withDefault "" value_
        ]
        []
