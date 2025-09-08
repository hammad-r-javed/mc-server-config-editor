module PageStyle exposing
    ( baseBgColour
    , baseFontFgColor
    , colourBlack
    , colourBlue
    , colourLightGreen
    , elementBgColour
    , inputFieldBgColour
    )

import Element as Elem
import Element.Background as ElemBg
import Element.Border as ElemBorder
import Element.Font as ElemFont
import Element.Input as ElemInput
import Element.Region as ElemRegion


baseBgColour =
    Elem.rgb 0.09 0.09 0.1


elementBgColour =
    Elem.rgb 0.2 0.2 0.23


inputFieldBgColour =
    Elem.rgb 0.25 0.25 0.28


baseFontFgColor =
    Elem.rgb 0.9 0.9 0.9


colourLightGreen =
    Elem.rgb 0.3 0.5 0.3


colourBlack =
    Elem.rgb 0 0 0


colourBlue =
    Elem.rgb 0.3 0.3 0.7
