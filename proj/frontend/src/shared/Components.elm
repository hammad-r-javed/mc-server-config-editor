module Components exposing
    ( logoOnlyNavBar
    , navBar
    )

import Element as Elem
import Element.Background as ElemBg
import Element.Border as ElemBorder
import Element.Font as ElemFont
import Element.Input as ElemInput
import Element.Region as ElemRegion
import PageStyle as Style


logoOnlyNavBar : Elem.Element msg
logoOnlyNavBar =
    Elem.row
        [ Elem.width Elem.fill
        , Elem.height Elem.shrink
        , Elem.centerX
        , Elem.padding 25
        , ElemBg.color Style.elementBgColour
        , ElemBorder.shadow
            { size = 3.0
            , offset = ( 0.0, 0.0 )
            , blur = 5.0
            , color = Elem.rgb 0.05 0.05 0.05
            }
        ]
        [ Elem.text "Breakdown"
        ]


navBar : Elem.Element msg
navBar =
    -- TODO - complete
    Elem.text "regular navbar"
