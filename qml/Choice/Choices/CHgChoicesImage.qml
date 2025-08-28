import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicLoader/v1"
import "../../basic_librairies/BasicText/v4"
import "../../basic_librairies/BasicDebug/v1"

Item {

    id: iChoicesImage

    property real pXPercent
    property real pYPercent
    property real pWidthPercent
    property real pHeightPercent: 1 - pYPercent


    CHc {
        id: iCHc
    }


    x: parent.width * pXPercent
    y: parent.height * pYPercent
    width: parent.width * pWidthPercent
    height: parent.height * pHeightPercent

    //////////////////////////////////
    // BasicDebugRectangle {visible: mIsDebug; color: "orange"; anchors.fill: parent}
    //////////////////////////////////

    // BasicTextFitToWindowWidth {
    //     id: iTitle

    //     xPercent: 0.1
    //     yPercent: pYPercent
    //     widthPercent: 1 - pXPercent*2

    //     borderColor: "yellow"
    //     borderWidthPercent: 0.001
    //     textColor: "black"
    //     textFontPixelSizePercent: 0.06
    //     textIsAlignToCenterV: true
    //     text: mTitle
    //     textIsWrapped: true
    // }

    BasicTextFitToWindowWidth {
        id: iQuestion

        xPercent: 0.15
        yPercent: pYPercent
        widthPercent: 1 - pXPercent*2

        borderColor: "yellow"
        borderWidthPercent: 0.001
        textColor: "black"
        textFontPixelSizePercent: 0.05
        textIsAlignToCenterV: true
        text: mQuestion
        textIsWrapped: true
    }

    Item {
        id: iAvailableChoices
        anchors.fill: parent

        Repeater {
            id: iRepeater
            model: mShadowListChoices.length

            CHgOneChoiceImage {
                id: iOneChoiceImage
                xPercent: pXPercent
                yPercent: pYPercent
                widthPercent: 0.1
                heightPercent: 0.6
            }
        }
    }


    CHgChoiceTimer {
        id: mChoiceTimer
        xPercent: 0.1
        yPercent: 0.01
        widthPercent: 0.8
        heightPercent: 0.03
    }

    onVisibleChanged: {
        if (visible) {
            recalibratePositions()
        }
    }

    function stopTimer() {
        mChoiceTimer.stopTimer()
        iChoicesImage.visible = false
    }



    function recalibratePositions() {
        let yPadding = iChoicesImage.pYPercent
        let xPadding = iChoicesImage.pXPercent

        // iTitle.adjustWindow()
        // iTitle.yPercent = yPadding
        // yPadding += iTitle.heightPercent + iCHc.mPADDING_H

        iQuestion.adjustWindow()
        iQuestion.yPercent = yPadding
        yPadding += iQuestion.heightPercent + iCHc.mPADDING_H

        for (let i=0; i < iRepeater.model; i++) {
            iAvailableChoices.children[i].yPercent = yPadding
            iAvailableChoices.children[i].xPercent = xPadding
            xPadding += iAvailableChoices.children[i].widthPercent + iCHc.mPADDING_H
        }
        yPadding += iAvailableChoices.children[0].heightPercent + iCHc.mPADDING_H
        mChoiceTimer.yPercent = yPadding
        yPadding += mChoiceTimer.heightPercent + iCHc.mPADDING_H

    }
}
