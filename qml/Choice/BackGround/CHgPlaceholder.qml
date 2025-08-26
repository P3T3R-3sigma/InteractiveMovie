import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicText/v4"

Item {

    id: iPlaceholder

    signal sOnClicked()

    anchors.fill: parent

    visible: false
    z: parent.z+10
    BasicTextFitToText {
        id: iPlaceholderText
        text: mTitle

        textIsAlignToCenter: true

        textFontForceSizePixel: 40
        textColor: "black"
        borderColor: "Pink"
        borderWidthPercent: 0.01

        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent

        onClicked: {
            sOnClicked()
        }
    }


    onVisibleChanged: {
        if (visible && mDisplay === mDisplayEnum.IMAGE) {
            mCHgChoices.visible = true
        }
    }

}
