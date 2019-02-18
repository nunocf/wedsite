module Page.Rsvp.Types exposing
    ( AcceptForm
    , Accepted
    , AdditionalGuest
    , Allergies
    , Code
    , Coming
    , Course(..)
    , Diet(..)
    , DietNeeds
    , Guest
    , GuestsDetailsForm
    , ID
    , Invitation
    , Name
    , acceptFormDecoder
    , decodeGuest
    , decodeInvitation
    , encodeAcceptedForm
    , encodeGuestsDetailsForm
    , generateAdditionalGuests
    , getDietType
    , getFoodOption
    , guestDecoder
    , guestsDetailsDecoder
    )

import Json.Decode as Decode exposing (Decoder, nullable)
import Json.Decode.Pipeline exposing (custom, hardcoded, optional, required, resolve)
import Json.Encode as Encode
import Language
import Translations


type alias Guest =
    { id : ID
    , name : Name
    , diet : Maybe Diet
    , allergies : Maybe Allergies
    , coming : Maybe Coming
    }


type alias ID =
    String


type alias Name =
    String


type Diet
    = Normal (Maybe Course)
    | Vegetarian
    | Halal
    | Other DietNeeds


type alias DietNeeds =
    String


type Course
    = Meat1
    | Meat2


type alias Coming =
    Bool


type alias Accepted =
    Bool


type alias Allergies =
    String


type alias Invitation =
    { id : String
    , code : Code
    , preferedLang : Translations.Lang
    , maxGuests : Int
    , accepted : Maybe Accepted
    }


type alias Code =
    String


type alias AcceptForm =
    { guests : List Guest
    , additionalGuests : List AdditionalGuest
    , invitation : Invitation
    }


type alias GuestsDetailsForm =
    { guests : List Guest
    , invitation : Invitation
    }


type alias AdditionalGuest =
    { name : Name
    , coming : Coming
    }


decodeInvitation : Decoder Invitation
decodeInvitation =
    Decode.succeed Invitation
        |> required "id" Decode.string
        |> required "code" Decode.string
        |> required "lang" Language.langDecoder
        |> required "max_guests" Decode.int
        |> required "accepted" (nullable Decode.bool)


decodeGuest : Decoder Guest
decodeGuest =
    Decode.succeed guestDecoder
        |> required "name" Decode.string
        |> required "diet_type" (nullable Decode.string)
        |> required "food_choice" (nullable Decode.string)
        |> required "diet_notes" (nullable Decode.string)
        |> required "has_food_allergies" (nullable Decode.bool)
        |> optional "food_allergy_notes" Decode.string ""
        |> required "coming" (nullable Decode.bool)
        |> optional "id" Decode.string ""
        |> resolve


guestDecoder : String -> Maybe String -> Maybe String -> Maybe String -> Maybe Bool -> String -> Maybe Coming -> ID -> Decoder Guest
guestDecoder name diet foodOption dietNotes hasAllergies allergyNotes coming id =
    let
        dietType =
            getDietType diet foodOption dietNotes

        allergies =
            case hasAllergies of
                Just jsonBool ->
                    case jsonBool of
                        True ->
                            Just allergyNotes

                        False ->
                            Nothing

                Nothing ->
                    Nothing
    in
    Decode.succeed (Guest id name dietType allergies coming)


getDietType : Maybe String -> Maybe String -> Maybe String -> Maybe Diet
getDietType diet foodOption notes =
    case diet of
        Just dietType ->
            case dietType of
                "normal" ->
                    Just (getFoodOption foodOption)

                "vegetarian" ->
                    Just Vegetarian

                "halal" ->
                    Just Halal

                _ ->
                    notes
                        |> Maybe.withDefault ""
                        |> Other
                        |> Just

        Nothing ->
            Nothing


getFoodOption : Maybe String -> Diet
getFoodOption foodOption =
    case foodOption of
        Just option ->
            case option of
                "option1" ->
                    Normal (Just Meat1)

                "option2" ->
                    Normal (Just Meat2)

                _ ->
                    Normal Nothing

        Nothing ->
            Normal Nothing


acceptFormDecoder : Decoder AcceptForm
acceptFormDecoder =
    Decode.field "data" formDecoder


guestsDetailsDecoder : Decoder GuestsDetailsForm
guestsDetailsDecoder =
    Decode.field "data" guestsDetailsDataDecoder


guestsDetailsDataDecoder : Decoder GuestsDetailsForm
guestsDetailsDataDecoder =
    Decode.succeed GuestsDetailsForm
        |> required "guests" (Decode.list decodeGuest)
        |> required "invitation" decodeInvitation


formDecoder : Decoder AcceptForm
formDecoder =
    Decode.succeed decodeForm
        |> required "guests" (Decode.list decodeGuest)
        |> required "invitation" decodeInvitation
        |> resolve


decodeForm : List Guest -> Invitation -> Decoder AcceptForm
decodeForm guests invitation =
    let
        additionalGuests =
            generateAdditionalGuests (List.length guests) invitation.maxGuests
    in
    Decode.succeed (AcceptForm guests additionalGuests invitation)


generateAdditionalGuests : Int -> Int -> List AdditionalGuest
generateAdditionalGuests currentCount maxGuests =
    let
        additionalGuestCount =
            maxGuests - currentCount

        additionalGuests =
            case additionalGuestCount >= 0 of
                False ->
                    []

                True ->
                    List.range 0 (additionalGuestCount - 1)
                        |> List.map (\_ -> AdditionalGuest "Additional guest" False)
    in
    additionalGuests


encodeAcceptedForm : AcceptForm -> Encode.Value
encodeAcceptedForm { guests, additionalGuests, invitation } =
    let
        addedGuests =
            additionalGuests
                |> List.filter (\ag -> ag.coming == True)
                |> List.map additionalGuestToGuest

        allGuests =
            guests ++ addedGuests
    in
    Encode.object
        [ ( "invitation", encodeInvitation invitation )
        , ( "guests", Encode.list encodeGuest allGuests )
        ]


encodeGuestsDetailsForm : GuestsDetailsForm -> Encode.Value
encodeGuestsDetailsForm { guests, invitation } =
    Encode.object
        [ ( "invitation", encodeInvitation invitation )
        , ( "guests", Encode.list encodeGuest guests )
        ]


additionalGuestToGuest : AdditionalGuest -> Guest
additionalGuestToGuest { name, coming } =
    Guest "" name Nothing Nothing (Just coming)


encodeInvitation : Invitation -> Encode.Value
encodeInvitation { id, code, preferedLang, accepted } =
    let
        encodedAccepted =
            case accepted of
                Just val ->
                    Encode.bool val

                Nothing ->
                    Encode.null
    in
    Encode.object
        [ ( "id", Encode.string id )
        , ( "code", Encode.string code )
        , ( "preferedLang", Language.langEncoder preferedLang )
        , ( "accepted", encodedAccepted )
        ]


encodeGuest : Guest -> Encode.Value
encodeGuest { id, name, diet, allergies, coming } =
    let
        encodedComing =
            case coming of
                Just value ->
                    Encode.bool value

                Nothing ->
                    Encode.null
    in
    Encode.object
        ([ ( "id"
           , if id == "" then
                Encode.null

             else
                Encode.string id
           )
         , ( "name", Encode.string name )
         , ( "coming", encodedComing )
         ]
            ++ encodeAllergies allergies
            ++ encodeDiet diet
        )


encodeAllergies : Maybe Allergies -> List ( String, Encode.Value )
encodeAllergies allergies =
    case allergies of
        Just allergyNotes ->
            [ ( "has_food_allergies", Encode.bool True )
            , ( "food_allergy_notes", Encode.string allergyNotes )
            ]

        Nothing ->
            [ ( "has_food_allergies", Encode.bool False )
            , ( "food_allergy_notes", Encode.null )
            ]


encodeDiet : Maybe Diet -> List ( String, Encode.Value )
encodeDiet diet =
    case diet of
        Nothing ->
            [ ( "diet_type", Encode.null )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.null )
            ]

        Just (Normal course) ->
            [ ( "diet_type", Encode.string "normal" )
            , ( "food_choice", encodeCourse course )
            , ( "diet_notes", Encode.null )
            ]

        Just Vegetarian ->
            [ ( "diet_type", Encode.string "vegetarian" )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.null )
            ]

        Just Halal ->
            [ ( "diet_type", Encode.string "halal" )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.null )
            ]

        Just (Other notes) ->
            [ ( "diet_type", Encode.string "other" )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.string notes )
            ]


encodeCourse : Maybe Course -> Encode.Value
encodeCourse course =
    case course of
        Just Meat1 ->
            Encode.string "option1"

        Just Meat2 ->
            Encode.string "option2"

        Nothing ->
            Encode.null
