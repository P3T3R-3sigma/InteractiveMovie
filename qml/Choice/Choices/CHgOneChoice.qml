import QtQuick
import Felgo
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicDebug/v1"

BasicTextFitToWindowWidth {
    id: iOneChoice


    xPercent: 0
    yPercent: 0
    widthPercent : 0

    textFontPixelSizePercent: 0.07
    paddingPercentHeight: 0
    textIsAlignToCenterV: true
    textColor: "black"

    borderColor: "green"
    borderWidthPercent: 0.001
    text:  getText()
    textIsWrapped: true

    MouseArea {
        id: iMouseArea
        anchors.fill: parent

        hoverEnabled: true

        enabled: mShadowListChoices[model.index].mStatus === mStatusEnum.ACCESSIBLE

        onEntered: {
            iOneChoice.borderColor = "purple"
        }
        onExited: {
            iOneChoice.borderColor = "green"
        }

        onClicked: {
            stopTimer()
            iChoiceManager.setStatusChanges()
            iChoiceManager.hideChoices()
            mShadowListChoices[model.index].visible = true
            // mShadowListChoices[model.index].z = iChoiceManager.z+1
            iChoiceManager.visible = false
        }
    }

    function getText() {
        if (mShadowListChoices[model.index].mStatus === mStatusEnum.ACCESSIBLE) {
            return mShadowListChoices[model.index].mTextBeforeChoosing
        }
        return mShadowListChoices[model.index].mTextIfLocked
    }
}



