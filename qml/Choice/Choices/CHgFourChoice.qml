import QtQuick
import Felgo

Item {

    id: item
    anchors.fill: parent
    z: parent.z

    property var pListScenes: []


    property real lXStartPercent: 0
    property real lYStartPercent: 0.657
    property real lWidthPercent: 0.204
    property real lHeightPercent: 0.0443
    property real lHorizontalSpace: 0.0619
    property real lVerticalSpace: 0.025
    property real lTextSizePercent: 0.015



    CHgOneChoice {
        id: iChoice1
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 - widthPercent - lHorizontalSpace/2
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[0]
    }

    CHgOneChoice {
        id: iChoice2
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 + lHorizontalSpace/2
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[1]
    }

    CHgOneChoice {
        id: iChoice3
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 - widthPercent - lHorizontalSpace/2
        yPercent: lYStartPercent + lVerticalSpace + lHeightPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[2]
    }

    CHgOneChoice {
        id: iChoice4
        anchors.horizontalCenter: parent.horizontalCenter
        xPercent: 0.5 + lHorizontalSpace/2
        yPercent: lYStartPercent + lVerticalSpace + lHeightPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        textSizePercent: lTextSizePercent

        pNextScene: pListScenes[3]
    }
}
