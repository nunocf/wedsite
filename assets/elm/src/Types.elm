module Types exposing (Msg(..))

import Browser exposing (UrlRequest)
import Page.Code as Code
import Page.Coming as Coming
import Page.Complete as Complete
import Page.GuestDetails as GuestDetails
import Page.Home as Home
import Page.Home.Types
import Page.NotComing as NotComing
import Route exposing (Route)
import Session exposing (Session)
import Translations exposing (Lang)
import Url exposing (Url)


type Msg
    = Ignored
    | ChangedRoute (Maybe Route)
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest
    | GotHomeMsg Page.Home.Types.Msg
    | GotCodeMsg Code.Msg
    | GotComingMsg Coming.Msg
    | GotCompleteMsg Complete.Msg
    | GotGuestDetailsMsg GuestDetails.Msg
    | ShowLanguages
    | ChangeLanguage Lang
    | CloseAvailableLanguages
    | GotNotComingMsg NotComing.Msg
