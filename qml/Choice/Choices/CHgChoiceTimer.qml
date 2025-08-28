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
            duration: 10000

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
        if (mIsTimer) {
            console.log(iChoiceManager.getTime())
            iNumberAnimationX.duration = iChoiceManager.getTime()
            iNumberAnimationX.to = 0
            iParallelAnimation.running = true
        } else {
            iChoiceManager.visible = false
            mDefaultChoice.visible = true
        }
    }
    function stopTimer() {
        iChoiceManager.setStatusChanges()
        iParallelAnimation.running = false
        iTimerGraphic.width = parent.width * widthPercent
    }
}
