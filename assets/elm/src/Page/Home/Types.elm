module Page.Home.Types exposing (ActiveTab(..), Modal, Model, Msg(..))

import Json.Decode as Decode
import Page.Home.Locations exposing (Locations)
import Session exposing (Session)
import Time


type Msg
    = MapMoved Decode.Value
    | ActivateModal String
    | DeactivateModal
    | ChangeTab ActiveTab
    | Tick Time.Posix
    | AdjustTimeZone Time.Zone


type alias Model =
    { session : Session
    , locations : Locations
    , activeModal : Maybe Modal
    , activeTab : ActiveTab
    , time : Time.Posix
    , zone : Time.Zone
    , weddingDay : Time.Posix
    }


type alias Modal =
    String


type ActiveTab
    = Location
    | Airplane
    | Train
    | Bus
    | Car
    | Bike
    | Walk
    | RentCar
