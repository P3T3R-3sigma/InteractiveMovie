import QtQuick
import Felgo
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicImageHover/v1"
import "../../basic_librairies/BasicDebug/v1"

BasicImageHover {
    id: iOneChoice

    sourceSimpleMain: "Angel/Angel_001.jpg"
    visible: false

    BasicTextFitToWindowWidth {

        widthPercent: 1
        heightPercent: 1

        textIsAlignToCenter: true
        textFontPixelSizePercent: 0.03
        paddingPercentHeight: iCHc.mPADDING_H
        textColor: "black"

        borderColor: "green"
        borderWidthPercent: 0.01
        text:  getText()
        textIsWrapped: true
    }
    onClicked: {
        stopTimer()
        iChoiceManager.visible = false
        mShadowListChoices[model.index].visible = true
    }

    Component.onCompleted: visible = true

    function getText() {
        if (mShadowListChoices[model.index].mStatus === mStatusEnum.ACCESSIBLE) {
            return mShadowListChoices[model.index].mTextBeforeChoosing
        }
        return mShadowListChoices[model.index].mTextIfLocked
    }
}



