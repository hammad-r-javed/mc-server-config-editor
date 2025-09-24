port module Main exposing (main)

import Browser
import Element as Elem
import Element.Background as ElemBg
import Element.Border as ElemBorder
import Element.Font as ElemFont
import Element.Input as ElemInput
import Element.Region as ElemRegion
import Html exposing (Html)
import Http
import Json.Decode as JsonDecode
import Json.Encode as JsonEncode
import PageStyle as Style



--- PORTS

port requestServerConf : () -> Cmd msg
port onServerConfReceived : (String -> msg) -> Sub msg


-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type Model
    = NoServerConfLoaded



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( NoServerConfLoaded
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp
    | RequestServerConf
    | ServerConfReceived String -- TODO replace String with real model type


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( NoServerConfLoaded
            , Cmd.none
            )
        RequestServerConf ->
            -- TODO - capture and send config version to wails runtime
            let
                _ =
                    Debug.log "[DEBUG]" "RequestServerConf - message fired"
            in
            ( NoServerConfLoaded
            , requestServerConf()
            )
        ServerConfReceived value ->
            -- TODO - replace this stub with implementation
            let
                _ =
                    Debug.log "[DEBUG]" <| String.concat ["ServerConfReceived - ", value]
            in
            ( NoServerConfLoaded
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    onServerConfReceived ServerConfReceived



-- VIEW


view : Model -> Html Msg
view model =
    Elem.layout
        [ ElemBg.color Style.baseBgColour
        , ElemFont.color Style.baseFontFgColor
        ]
    <|
        viewController model


viewController : Model -> Elem.Element Msg
viewController model =
    case model of
        NoServerConfLoaded ->
            noServerConfLoadedView


noServerConfLoadedView : Elem.Element Msg
noServerConfLoadedView =
    let
        paddingCol =
            Elem.column
                [ Elem.width <| Elem.px 30
                ]
                []
    in
    Elem.row
        [ Elem.width Elem.fill
        ]
        [ paddingCol
        , Elem.column
            [ Elem.width Elem.fill
            ]
            -- TODO - replace this stub with real button UI
            [ ElemInput.button
                [ Elem.width <| Elem.fill
                , Elem.height <| Elem.px 30
                , ElemBg.color Style.elementBgColour
                ]
                { label = Elem.text "select project"
                , onPress = Just RequestServerConf
                }
            ]
        , paddingCol
        ]
