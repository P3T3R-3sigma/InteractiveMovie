import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"

BasicImageSource {
    id: iSecondaryImage

    visible: false

    anchors.fill: parent
    fillMode: Image.PreserveAspectFit

    sourceSimple: mSecondaryImageSource

    onVisibleChanged: {
        if (visible) {
            iChoiceManager.showChoices()
        }
    }
}
