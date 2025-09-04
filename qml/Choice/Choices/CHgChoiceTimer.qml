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
    z: parent.z

    Rectangle {
        id: iTimerGraphic
        x: parent.width * xPercent
        y: parent.height * yPercent
        width: parent.width * widthPercent
        height: parent.height * heightPercent

        z: iTimerGraphicBorder.z+1

        color: "#f3b831"
        radius: height/2
    }
    Rectangle {
        id: iTimerGraphicBorder
        x: parent.width * xPercent
        y: parent.height * yPercent
        width: parent.width * widthPercent
        height: parent.height * heightPercent

        z: parent.z

        color: "#e5e5e5"
        radius: height/4
    }

    ParallelAnimation {
        id: iParallelAnimation

        running: false
        loops: 1
        NumberAnimation {
            id: iNumberAnimationWidth
            target: iTimerGraphic
            property: "width"
            duration: 10000

        }
        NumberAnimation {
            id: iNumberAnimationX
            target: iTimerGraphic
            property: "x"
            duration: 10000

        }
        onFinished: {
            startFadeOut(mDefaultChoice)
        }
    }


    onVisibleChanged: {
        if (visible) {
            startTimer()
        } else {
            stopTimer()
        }
    }

    function startTimer() {
        if (mIsTimer) {
            iNumberAnimationWidth.duration = iChoiceManager.getTime()
            iNumberAnimationWidth.to = 0
            iNumberAnimationX.duration = iChoiceManager.getTime()
            iNumberAnimationX.to = 0.5 * parent.width
            iParallelAnimation.running = true
        } else {
            iChoiceManager.visible = false
            mDefaultChoice.visible = true
        }
    }
    function stopTimer() {
        setStatusChanges()
        iParallelAnimation.running = false
        iTimerGraphic.width = parent.width * widthPercent
        iTimerGraphic.x = parent.width * xPercent
    }
    function pauseTimer() {
        iParallelAnimation.running = false
    }
}
