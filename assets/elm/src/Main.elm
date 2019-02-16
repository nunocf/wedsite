module Main exposing (main)

import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Nav exposing (Key)
import Cmd exposing (storeLanguage)
import Html exposing (Html, div, main_)
import Html.Events exposing (onClick)
import Json.Decode as Decode exposing (Value)
import Language
import Location exposing (Location)
import NavBar
import Page
import Page.Blank as Blank
import Page.Code as Code
import Page.Coming as Coming
import Page.Complete as Complete
import Page.Home as Home
import Page.NotFound as NotFound
import Route exposing (Route)
import Session exposing (Session)
import Translations exposing (Lang)
import Types exposing (Msg(..))
import Url exposing (Url)
import Url.Parser


type alias Flags =
    { language : Decode.Value }


type Model
    = NotFound Session
    | Redirect Session
    | Home Home.Model
    | Code Code.Model
    | Coming Coming.Model



-- | Complete Complete.Model
--
--
--
-- MODEL
-- init : Flags -> Url -> Key -> ( Model, Cmd Msg )
-- init flags url key =
--     let
--         language =
--             flags.language
--                 |> Decode.decodeValue Decode.string
--                 |> Language.langFromFlag
--         route =
--             parseUrl url
--         ( pageModel, commands ) =
--             initPageModel route
--     in
--     ( { currentLanguage = language
--       , showLanguages = False
--       , title = Translations.title language
--       , key = key
--       , pageModel = pageModel
--       , route = route
--       }
--     , Cmd.batch commands
--     )


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url navKey =
    let
        language =
            flags.language
                |> Decode.decodeValue Decode.string
                |> Language.langFromFlag
    in
    changeRouteTo (Route.fromUrl url) (Redirect (Session language False navKey))


view : Model -> Document Msg
view model =
    let
        viewPage page toMsg config =
            let
                { title, body } =
                    Page.view page session config

                session =
                    toSession model
            in
            { title = title
            , body =
                [ div [ onClick <| CloseAvailableLanguages ]
                    [ NavBar.view session page
                    ]
                , div [ onClick <| CloseAvailableLanguages ]
                    (List.map (Html.map toMsg) body)
                ]
            }
    in
    case model of
        Redirect _ ->
            viewPage Page.Other (\_ -> Ignored) Blank.view

        NotFound _ ->
            viewPage Page.Other (\_ -> Ignored) NotFound.view

        Home home ->
            viewPage Page.Home GotHomeMsg (Home.view home)

        Code code ->
            viewPage Page.Code GotCodeMsg (Code.view code)

        Coming code ->
            viewPage Page.Coming GotComingMsg (Coming.view code)



-- Complete code ->
--     viewPage (Page.Profile username) (\_ -> Ignored) (Complete.view code)
-- UPDATE


toSession : Model -> Session
toSession page =
    case page of
        Redirect session ->
            session

        NotFound session ->
            session

        Home home ->
            Home.toSession home

        Code code ->
            Code.toSession code

        Coming code ->
            Coming.toSession code



-- Complete code ->
--     Complete.toSession code


changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    let
        session =
            toSession model
    in
    case maybeRoute of
        Nothing ->
            ( NotFound session, Cmd.none )

        Just Route.Home ->
            Home.init session
                |> updateWith Home GotHomeMsg model

        Just Route.Code ->
            Code.init session
                |> updateWith Code GotCodeMsg model

        Just (Route.Coming code) ->
            Coming.init session code
                |> updateWith Coming GotComingMsg model

        _ ->
            ( NotFound session, Cmd.none )



-- Just Route.Rsvp ->
--     Code.init session
--         |> updateWith Login GotRsvpMsg model
-- Just (Route.Complete code)->
--     Complete.init session
--         |> updateWith Login GotCompleteMsg model
-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( Ignored, _ ) ->
            ( model, Cmd.none )

        ( ChangeLanguage lang, _ ) ->
            ( updateLang model lang, Cmd.storeLanguage lang )

        ( CloseAvailableLanguages, _ ) ->
            ( updateShowLanguages model False, Cmd.none )

        ( ShowLanguages, _ ) ->
            ( updateShowLanguages model True, Cmd.none )

        ( ClickedLink urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl (Session.navKey (toSession model)) (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )

        ( ChangedUrl url, _ ) ->
            changeRouteTo (Route.fromUrl url) model

        ( ChangedRoute route, _ ) ->
            changeRouteTo route model

        ( GotHomeMsg subMsg, Home home ) ->
            Home.update subMsg home
                |> updateWith Home GotHomeMsg model

        ( GotCodeMsg subMsg, Code code ) ->
            Code.update subMsg code
                |> updateWith Code GotCodeMsg model

        ( GotComingMsg subMsg, Coming code ) ->
            Coming.update subMsg code
                |> updateWith Coming GotComingMsg model

        ( _, _ ) ->
            -- Disregard messages that arrived for the wrong page.
            ( model, Cmd.none )


updateWith : (subModel -> Model) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toModel toMsg model ( subModel, subCmd ) =
    ( toModel subModel
    , Cmd.map toMsg subCmd
    )


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = ChangedUrl
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        NotFound _ ->
            Sub.none

        Redirect _ ->
            Sub.none

        Home home ->
            Sub.map GotHomeMsg (Home.subscriptions home)

        Code code ->
            Sub.map GotCodeMsg (Code.subscriptions code)

        Coming code ->
            Sub.map GotComingMsg (Coming.subscriptions code)


onUrlChange : Url -> Msg
onUrlChange url =
    ChangedUrl url


updateShowLanguages : Model -> Bool -> Model
updateShowLanguages model value =
    case model of
        NotFound session ->
            NotFound (Session.setShowLanguages session value)

        Redirect session ->
            Redirect (Session.setShowLanguages session value)

        Home m ->
            Home { m | session = Session.setShowLanguages (toSession model) value }

        Code m ->
            Code { m | session = Session.setShowLanguages (toSession model) value }

        Coming m ->
            Coming { m | session = Session.setShowLanguages (toSession model) value }


updateLang : Model -> Translations.Lang -> Model
updateLang model language =
    case model of
        NotFound session ->
            NotFound (Session.setLanguage session language)

        Redirect session ->
            Redirect (Session.setLanguage session language)

        Home m ->
            Home { m | session = Session.setLanguage (toSession model) language }

        Code m ->
            Code { m | session = Session.setLanguage (toSession model) language }

        Coming m ->
            Coming { m | session = Session.setLanguage (toSession model) language }
