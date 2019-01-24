module Main exposing (main)

import Browser exposing (Document)
import Cmd exposing (storeLanguage)
import Html exposing (Html, main_)
import Html.Events exposing (onClick)
import Json.Decode as Decode exposing (Value)
import Language
import MainPage exposing (view)
import Msg exposing (Msg)
import Translations exposing (Lang)


type alias Flags =
    { language : Value }



-- MODEL


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , title : String
    , showFullPoem : Bool
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        language =
            flags.language
                |> Decode.decodeValue Decode.string
                |> Language.langFromFlag
    in
    ( { currentLanguage = language
      , showAvailableLanguages = False
      , title = Translations.title language
      , showFullPoem = False
      }
    , Cmd.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.ChangeLanguage language ->
            ( { model
                | currentLanguage = language
                , title = Translations.title language
              }
            , Cmd.storeLanguage language
            )

        Msg.CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }, Cmd.none )

        Msg.ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )

        Msg.ShowPoem value ->
            ( { model | showFullPoem = value }, Cmd.none )



-- VIEW


view : Model -> Document Msg
view model =
    { title = model.title
    , body =
        [ main_ [ onClick Msg.CloseAvailableLanguages ]
            (MainPage.view
                model.currentLanguage
                model.showAvailableLanguages
                model.showFullPoem
            )
        ]
    }


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
