module Page.Home.Types exposing (..)

import Session exposing(Session)
import Page.Home.Locations exposing (Locations)
import Json.Decode as Decode 

type Msg
    = MapMoved Decode.Value
    | ActivateModal String
    | DeactivateModal

type alias Model =
    { session : Session
    , locations : Locations
    , activeModal : Maybe Modal
    }

type alias Modal =
    String