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

port requestProject : () -> Cmd msg
port onProjectReceived : (String -> msg) -> Sub msg


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
    = NoProjectSelected



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( NoProjectSelected
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp
    | RequestProject
    | ProjectReceived String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( NoProjectSelected
            , Cmd.none
            )
        RequestProject ->
            -- TODO - implement
            let
                _ =
                    Debug.log "[DEBUG]" "RequestProject - message fired"
            in
            ( NoProjectSelected
            , requestProject()
            )
        ProjectReceived value ->
            let
                _ =
                    Debug.log "[DEBUG]" <| String.concat ["ProjectReceived - ", value]
            in
            ( NoProjectSelected
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    onProjectReceived ProjectReceived



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
        NoProjectSelected ->
            noProjectLoadedView


noProjectLoadedView : Elem.Element Msg
noProjectLoadedView =
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
            -- TODO - replace testing button with real button
            [ ElemInput.button
                [ Elem.width <| Elem.fill
                , Elem.height <| Elem.px 30
                , ElemBg.color Style.elementBgColour
                ]
                { label = Elem.text "select project"
                , onPress = Just RequestProject
                }
            ]
        , paddingCol
        ]
