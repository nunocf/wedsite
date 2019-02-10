port module Page.Home.Gmaps exposing (addMarkers, initMaps, mapMoved, moveMap)

import Json.Decode exposing (Value)



-- PORTS


port moveMap : Value -> Cmd msg


port mapMoved : (Value -> msg) -> Sub msg


port addMarkers : Value -> Cmd msg


port initMaps : Value -> Cmd msg
