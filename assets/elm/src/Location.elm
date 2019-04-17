module Location exposing
    ( GMPos
    , Location(..)
    , Locations
    , decode
    , encode
    , encodeLocation
    , initLocations
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import Json.Encode as Encode


type Location
    = GroomHouse GMPos
    | BrideHouse GMPos
    | Church GMPos
    | Restaurant GMPos


type alias GMPos =
    { lat : Float
    , lng : Float
    }


type alias LocationString =
    String


type alias Locations =
    { groomHouse : Location
    , brideHouse : Location
    , church : Location
    , restaurant : Location
    }


encode : Locations -> Decode.Value
encode { groomHouse, brideHouse, church, restaurant } =
    [ groomHouse
    , brideHouse
    , church
    , restaurant
    ]
        |> Encode.list encodeLocation


initLocations : Locations
initLocations =
    { groomHouse = GroomHouse (GMPos 45.396072 20.403829)
    , brideHouse = BrideHouse (GMPos 45.384736 20.377857)
    , church = Church (GMPos 45.391338 20.392822)
    , restaurant = Restaurant (GMPos 45.321671 20.434525)
    }


encodeLocation : Location -> Decode.Value
encodeLocation location =
    case location of
        GroomHouse pos ->
            Encode.object
                [ ( "name", Encode.string "groomHouse" )
                , ( "location", encodeGMPos pos )
                ]

        BrideHouse pos ->
            Encode.object
                [ ( "name", Encode.string "brideHouse" )
                , ( "location", encodeGMPos pos )
                ]

        Church pos ->
            Encode.object
                [ ( "name", Encode.string "church" )
                , ( "location", encodeGMPos pos )
                ]

        Restaurant pos ->
            Encode.object
                [ ( "name", Encode.string "restaurant" )
                , ( "location", encodeGMPos pos )
                ]


decode : Decode.Decoder Location
decode =
    Decode.succeed initLocation
        |> required "name" Decode.string
        |> required "location" decodeGMPos


initLocation : LocationString -> GMPos -> Location
initLocation locString gmPos =
    case locString of
        "groomHouse" ->
            GroomHouse gmPos

        "brideHouse" ->
            BrideHouse gmPos

        "church" ->
            Church gmPos

        "restaurant" ->
            Restaurant gmPos

        _ ->
            GroomHouse (GMPos 0 0)


decodeGMPos : Decoder GMPos
decodeGMPos =
    Decode.succeed GMPos
        |> required "lat" Decode.float
        |> required "lng" Decode.float


encodeGMPos : GMPos -> Decode.Value
encodeGMPos { lat, lng } =
    Encode.object
        [ ( "lat", Encode.float lat )
        , ( "lng", Encode.float lng )
        ]
