import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicDebug/v1"
import "../../basic_librairies/BasicText/v4"


BasicImageSource {
    id: iSecondaryImage

    visible: false

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

    anchors.fill: parent
    fillMode: Image.PreserveAspectFit

    sourceSimple: {
        if (mSecondaryImageSource) {
            return mSecondaryImageSource + ".png"
        }
        return ""
    }

    onVisibleChanged: {
        if (visible) {
            showChoices()
        }
    }


    ////////////////////////////
     // BasicDebugRectangle{ visible: true}
    ////////////////////////////
}
