import QtQuick
import Felgo

Item {

    id: item
    anchors.fill: parent

    property var pListScenes: []


    property real lXStartPercent: 0.164
    property real lYStartPercent: 810/1080*0.8
    property real lWidthPercent: 0.133
    property real lHeightPercent: 0.3    //
    property real lHorizontalSpace: 0.051
    property real lVerticalSpace: 0

    CHgOneChoiceImage {
        id: iChoice1
        xPercent: 0.1 + 1606/1920*0.8
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        pSource: "Merida"
        pVisited: mVisitedMerida
        pHadSex: mHadSexMerida

        pNextScene: pListScenes[0]
    }

    CHgOneChoiceImage {
        id: iChoice2
        xPercent: 0.1 + 721/1920*0.8
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        pSource: "Amber"
        pVisited: mVisitedAmber
        pHadSex: mHadSexAmber

        pNextScene: pListScenes[1]
    }

    CHgOneChoiceImage {
        id: iChoice3
        xPercent: 0.1 + 298/1920*0.8
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        pSource: "Lollypop"
        pVisited: mVisitedLollypop
        pHadSex: mHadSexLollypop

        pNextScene: pListScenes[2]
    }

    CHgOneChoiceImage {
        id: iChoice4
        xPercent: 0.1 + 1175/1920*0.8
        yPercent: lYStartPercent
        widthPercent: lWidthPercent
        heightPercent: lHeightPercent
        pSource: "Milena"
        pVisited: mVisitedMilena
        pHadSex: mHadSexMilena

        pNextScene: pListScenes[3]
    }
}
