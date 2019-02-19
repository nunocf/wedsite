module Page.Home.Types exposing (Modal, Model, Msg(..))

import Json.Decode as Decode
import Page.Home.Locations exposing (Locations)
import Session exposing (Session)


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
