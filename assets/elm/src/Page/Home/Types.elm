module Page.Home.Types exposing (ActiveTab(..), Modal, Model, Msg(..))

import Json.Decode as Decode
import Page.Home.Locations exposing (Locations)
import Session exposing (Session)


type Msg
    = MapMoved Decode.Value
    | ActivateModal String
    | DeactivateModal
    | ChangeTab ActiveTab


type alias Model =
    { session : Session
    , locations : Locations
    , activeModal : Maybe Modal
    , activeTab : ActiveTab
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
