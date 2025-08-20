import QtQuick
import Felgo

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

    NumberAnimation {
        id: iNumberAnimationX
        target: iTimerGraphic
        property: "width"
        duration: pTime

        onFinished: {
            pDefaultChoice.visible = true
            iChoice.visible = false
        }
    }

    function startTimer() {
        if (pTime > 0) {
            iNumberAnimationX.to = 0
        }
    }
    function stopTimer() {
        iChoiceTimer.visible = false
    }
}
