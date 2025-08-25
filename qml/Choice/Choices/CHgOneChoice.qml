import QtQuick
import Felgo
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicDebug/v1"

BasicTextFitToWindowWidth {
    id: iOneChoice


    xPercent: 0
    yPercent: 0
    widthPercent : 0

    textFontPixelSizePercent: 0.03
    paddingPercentHeight: iCHc.mPADDING_H
    textIsAlignToCenterV: true
    textColor: "black"

    text:  getText()
    textIsWrapped: true

    MouseArea {
        id: iMouseArea
        anchors.fill: parent

        hoverEnabled: true

        enabled: mListChoices[model.index].mStatus === mStatusEnum.ACCESSIBLE

        onEntered: {
            iOneChoice.borderColor = "purple"
        }
        onExited: {
            iOneChoice.borderColor = "transparent"
        }

        onClicked: {
            pChoose = true
            iChoiceManager.visible = false
            mListChoices[model.index].visible = true
        }
    }

    function getText() {
        if (mListChoices[model.index].mStatus === mStatusEnum.ACCESSIBLE) {
            return mListChoices[model.index].mTextBeforeChoosing
        }
        return mListChoices[model.index].mTextIfLocked
    }
}



