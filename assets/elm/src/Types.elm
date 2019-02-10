module Types exposing (Msg(..))

import Browser exposing (UrlRequest)
import Page.Code as Code
import Page.Home as Home
import Route exposing (Route)
import Session exposing (Session)
import Translations exposing (Lang)
import Url exposing (Url)


type Msg
    = Ignored
    | ChangedRoute (Maybe Route)
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest
    | GotHomeMsg Home.Msg
    | GotCodeMsg Code.Msg
    | ShowLanguages
    | ChangeLanguage Lang
    | CloseAvailableLanguages
