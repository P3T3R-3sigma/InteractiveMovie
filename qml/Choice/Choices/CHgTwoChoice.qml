import QtQuick
import Felgo

Item {

    id: item
    anchors.fill: parent

    property var pListScenes: []


    property real lXStartPercent: 0
    property real lYStartPercent: 0.7264
    property real lWidthPercent: 0.2286
    property real lHeightPercent: 0.04817
    property real lHorizontalSpace: 0.07042
    property real lVerticalSpace: 0
    property real lTextSizePercent: 0.01734



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
}
