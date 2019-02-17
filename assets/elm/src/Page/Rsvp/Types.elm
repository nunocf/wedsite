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
    , diet : Diet
    , allergies : Allergies
    , coming : Coming
    }


type alias ID =
    String


type alias Name =
    String


type Diet
    = Normal Course
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
    Maybe String


type alias Invitation =
    { id : String
    , code : Code
    , preferedLang : Translations.Lang
    , maxGuests : Int
    , accepted : Accepted
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
        |> required "accepted" Decode.bool


decodeGuest : Decoder Guest
decodeGuest =
    Decode.succeed guestDecoder
        |> required "name" Decode.string
        |> required "diet_type" (nullable Decode.string)
        |> required "food_choice" (nullable Decode.string)
        |> required "diet_notes" (nullable Decode.string)
        |> required "has_food_allergies" Decode.bool
        |> optional "food_allergy_notes" Decode.string ""
        |> required "coming" Decode.bool
        |> optional "id" Decode.string ""
        |> resolve


guestDecoder : String -> Maybe String -> Maybe String -> Maybe String -> Bool -> String -> Bool -> ID -> Decoder Guest
guestDecoder name diet foodOption dietNotes hasAllergies allergyNotes coming id =
    let
        dietType =
            getDietType diet foodOption dietNotes

        allergies =
            case hasAllergies of
                True ->
                    Just allergyNotes

                False ->
                    Nothing
    in
    Decode.succeed (Guest id name dietType allergies coming)


getDietType : Maybe String -> Maybe String -> Maybe String -> Diet
getDietType diet foodOption notes =
    case diet of
        Just dietType ->
            case dietType of
                "normal" ->
                    getFoodOption foodOption

                "vegetarian" ->
                    Vegetarian

                "halal" ->
                    Halal

                _ ->
                    notes
                        |> Maybe.withDefault ""
                        |> Other

        Nothing ->
            Normal Meat1


getFoodOption : Maybe String -> Diet
getFoodOption foodOption =
    case foodOption of
        Just option ->
            case option of
                "option1" ->
                    Normal Meat1

                "option2" ->
                    Normal Meat2

                _ ->
                    Normal Meat1

        Nothing ->
            Normal Meat1


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
    Guest "" name (Normal Meat1) Nothing coming


encodeInvitation : Invitation -> Encode.Value
encodeInvitation { id, code, preferedLang, accepted } =
    Encode.object
        [ ( "id", Encode.string id )
        , ( "code", Encode.string code )
        , ( "preferedLang", Language.langEncoder preferedLang )
        , ( "accepted", Encode.bool accepted )
        ]


encodeGuest : Guest -> Encode.Value
encodeGuest { id, name, diet, allergies, coming } =
    Encode.object
        ([ ( "id"
           , if id == "" then
                Encode.null

             else
                Encode.string id
           )
         , ( "name", Encode.string name )
         , ( "coming", Encode.bool coming )
         ]
            ++ encodeAllergies allergies
            ++ encodeDiet diet
        )


encodeAllergies : Allergies -> List ( String, Encode.Value )
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


encodeDiet : Diet -> List ( String, Encode.Value )
encodeDiet diet =
    case diet of
        Normal course ->
            [ ( "diet_type", Encode.string "normal" )
            , ( "food_choice", Encode.string <| courseToString course )
            , ( "diet_notes", Encode.null )
            ]

        Vegetarian ->
            [ ( "diet_type", Encode.string "vegetarian" )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.null )
            ]

        Halal ->
            [ ( "diet_type", Encode.string "halal" )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.null )
            ]

        Other notes ->
            [ ( "diet_type", Encode.string "other" )
            , ( "food_choice", Encode.null )
            , ( "diet_notes", Encode.string notes )
            ]


courseToString : Course -> String
courseToString course =
    case course of
        Meat1 ->
            "option1"

        Meat2 ->
            "option2"



-- type Diet
--     = Normal Course
--     | Vegetarian
--     | Halal
--     | Other DietNeeds
-- type alias DietNeeds =
--     String
-- type Course
--     = Meat1
--     | Meat2
