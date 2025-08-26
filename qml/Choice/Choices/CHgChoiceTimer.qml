import QtQuick
import Felgo

import "../../"

Item {
    id: iChoiceTimer


    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent

    anchors.fill: parent

    Rectangle {
        id: iTimerGraphic
        x: parent.width * xPercent
        y: parent.height * yPercent
        width: parent.width * widthPercent
        height: parent.height * heightPercent

        color: "red"
        radius: height/2
    }
    Rectangle {
        id: iTimerGraphicBorder
        x: parent.width * xPercent
        y: parent.height * yPercent
        width: parent.width * widthPercent
        height: parent.height * heightPercent

        color: "transparent"
        border.color: "yellow"
        border.width: parent.height * heightPercent * 0.1
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
            duration: mTime

        }
        onFinished: {
            stopTimer()
            iChoiceManager.visible = false
            mDefaultChoice.visible = true

        }
    }


    onVisibleChanged: {
        if (visible) {
            startTimer()
        }
    }

    function startTimer() {
        if (mTime > 0) {
            iNumberAnimationX.to = 0
            iParallelAnimation.running = true
        } else if (mDisplay === mDisplayEnum.IMAGE) {

        } else {
            iChoiceManager.visible = false
            mDefaultChoice.visible = true
        }
    }
    function stopTimer() {
        iParallelAnimation.running = false
        iNumberAnimationX.duration = mTime
        iTimerGraphic.width = parent.width * widthPercent
    }
}
