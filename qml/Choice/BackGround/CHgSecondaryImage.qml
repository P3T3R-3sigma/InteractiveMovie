import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicDebug/v1"

BasicImageSource {
    id: iSecondaryImage

    visible: false

    anchors.fill: parent
    fillMode: Image.PreserveAspectFit

    sourceSimple: {
        if (mSecondaryImageSource) {
            return mSecondaryImageSource + ".png"
        }
        return ""
    }

    onVisibleChanged: showChoices()

    ////////////////////////////
     // BasicDebugRectangle{ visible: true}
    ////////////////////////////
}
