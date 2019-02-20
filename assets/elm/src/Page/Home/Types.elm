module Page.Home.Types exposing (Modal, Model, Msg(..), ActiveTab(..))

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
    = Airplane
    | Train
    | Bus
    | Car
    | Bike
    | Walk
    | RentCar
