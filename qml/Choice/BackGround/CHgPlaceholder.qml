import QtQuick
import Felgo

import "../../basic_librairies/BasicImageSource/v4"
import "../../basic_librairies/BasicText/v4"

Item {

    id: iPlaceholder

    signal sOnClicked()

    anchors.fill: parent

    visible: false
    BasicTextFitToText {
        id: iPlaceholderText
        text: mTitle

        yPercent: 0.05
        textFontForceSizePixel: 40
        textColor: "black"
        borderColor: "Pink"
        borderWidthPercent: 0.01

    }

    Rectangle {
        id: iTimerGraphic
        x: parent.width * 0.1
        y: parent.height * 0.8
        width: parent.width * 0.8
        height: parent.height * 0.03

        visible: !mChoiceVisible
        color: "red"
        radius: height/2
    }
    Rectangle {
        id: iTimerGraphicBorder
        x: parent.width * 0.1
        y: parent.height * 0.8
        width: parent.width * 0.8
        height: parent.height * 0.03

        visible: !mChoiceVisible
        color: "transparent"
        border.color: "yellow"
        border.width: parent.height * 0.03 * 0.1
        radius: height/2
    }

    ParallelAnimation {
        id: iParallelAnimation

        running: false
        loops: 1
        NumberAnimation {
            id: iNumberAnimationX
            target: iTimerGraphic
            property: "width"
            duration: 5000

        }
        onFinished: {
            stopTimer()
            sOnClicked()

        }
    }


    AppButton {
        id: skipVideo
        width: parent.width * 0.15
        height: parent.height * 0.10
        x: parent.width * 0.7
        y: parent.height * 0.65
        z: 20
        visible: !mChoiceVisible
        text: "Skip Video"
        onClicked: {
            stopTimer()
            sOnClicked()
        }
    }
    function startTimer() {
        iNumberAnimationX.to = 0
        iParallelAnimation.running = true
    }

    function stopTimer() {
        iParallelAnimation.running = false
        iNumberAnimationX.duration = 5000
        iTimerGraphic.width = parent.width * 0.8
    }

    onVisibleChanged: {
        if (visible) {
            if (mDisplay === mDisplayEnum.IMAGE) {
                iSecondaryImage.visible = true
            }
            startTimer()

        }
    }

}
