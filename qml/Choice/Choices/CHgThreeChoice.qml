import QtQuick
import Felgo

Item {
    id: item
    anchors.fill: parent
    z: parent.z

    property var pListScenes: []

    property real lXStartPercent: 0
    property real lYStartPercent: 0.7264
    property real lWidthPercent: 0.178765
    property real lHeightPercent: 0.0443
    property real lHorizontalSpace: 0.015
    property real lVerticalSpace: 0
    property real lTextSizePercent: 0.015



    CHgOneChoice {
        id: iChoice1
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 - widthPercent - lHorizontalSpace - widthPercent/2
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[0]
    }

    CHgOneChoice {
        id: iChoice2
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 - lWidthPercent/2
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[1]
    }

    CHgOneChoice {
        id: iChoice3
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 + lHorizontalSpace + widthPercent/2
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[2]
    }

}
