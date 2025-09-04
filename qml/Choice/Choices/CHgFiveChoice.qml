import QtQuick
import Felgo

Item {

    id: item
    anchors.fill: parent

    property var pListScenes: []


    property real lXStartPercent: 0
    property real lYStartPercent: 0.59336
    property real lWidthPercent: 0.2203
    property real lHeightPercent: 0.0345
    property real lHorizontalSpace: 0.0619
    property real lVerticalSpace: 0.00766
    property real lTextSizePercent: 0.013

    CHgOneChoice {
        id: iChoice1
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5-widthPercent/2
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[0]
    }

    CHgOneChoice {
        id: iChoice2
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5-widthPercent/2
        yPercent: lYStartPercent + (lHeightPercent + lVerticalSpace) * 1
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[1]
    }

    CHgOneChoice {
        id: iChoice3
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5-widthPercent/2
        yPercent: lYStartPercent + (lHeightPercent + lVerticalSpace) * 2
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[2]
    }

    CHgOneChoice {
        id: iChoice4
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5-widthPercent/2
        yPercent: lYStartPercent + (lHeightPercent + lVerticalSpace) * 3
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[3]
    }

    CHgOneChoice {
        id: iChoice5
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5-widthPercent/2
        yPercent: lYStartPercent + (lHeightPercent + lVerticalSpace) * 4
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[4]
    }
}
