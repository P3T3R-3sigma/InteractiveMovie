import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicDebug/v1"
import "../../basic_librairies/BasicText/v4"
import "../Choices"


BasicImageSource {
    id: iSecondaryImage

    anchors.fill: parent
    fillMode: Image.PreserveAspectFit

    visible: false


    ChgFourImageChoice {
        id: iFourImageChoice
        visible: false

        pListScenes: mShadowListChoices
    }

    BasicTextFitToText {
        id: iPlaceholderText
        text: mTitle

        visible: mDebugOverall
        z: 100

        yPercent: 0.05
        textFontForceSizePixel: 40
        textColor: "black"
        borderColor: "Pink"
        borderWidthPercent: 0.01
    }

    sourceSimple: {
        if (mSecondaryImageSource) {
            return mSecondaryImageSource
        }
        return ""
    }

    onVisibleChanged: {
        if (visible) {
            showChoices()
            iFourImageChoice.visible = true
        } else {
            iFourImageChoice.visible = false
        }
    }


    ////////////////////////////
     // BasicDebugRectangle{ visible: true}
    ////////////////////////////
}
