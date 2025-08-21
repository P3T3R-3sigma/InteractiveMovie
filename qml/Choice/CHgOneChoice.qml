import QtQuick
import Felgo
import "../basic_librairies/BasicText/v4"
import "../basic_librairies/BasicDebug/v1"

BasicTextFitToWindowWidth {
    id: iOneChoice


    xPercent: 0
    yPercent: 0
    widthPercent : 0

    textFontPixelSizePercent: 0.03
    paddingPercentHeight: iCHc.mPADDING_H
    textIsAlignToCenterV: true
    text: pListChoices[model.index].pTextBeforeChoosing
    textColor: "black"
    textIsWrapped: true


    MouseArea {
        id: iMouseArea
        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            iOneChoice.borderColor = "purple"
        }
        onExited: {
            iOneChoice.borderColor = "transparent"
        }

        onClicked: {
            iChoiceContainer.visible = false
            pListChoices[model.index].visible = true
        }
    }
}


