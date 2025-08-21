import QtQuick
import Felgo
import QtMultimedia

import "../basic_librairies/BasicLoader/v1"
import "../basic_librairies/BasicVideoSource/v1"

Item {
    id: iVideoBeforeChoice

    visible: false

    property var pVideoNext
    property var pImageNext

    anchors.fill: parent

    BasicVideoSource {
        id: iBasicVideoSourceBeforeChoice
        mSource: pVideoBeforeChoiceSource
        mVolume: pVideoVolume
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            //////////////////////////////
            console.log("Video end")
            //////////////////////////////
            iVideoBeforeChoice.visible = false
            if (pVideoWhileChoiceSource) {
                pVideoNext.visible = true
                pVideoNext.startVideo()
            } else if (pImageWhileChoiceSource) {
                pImageNext.visible = true
            } else {
                mBasicDisplay.error(iVideoBeforeChoice, "No image or video for choice.")
            }
            mCHgChoices.visible = true
        }
    }

    Component.onCompleted: {
        iBasicVideoSourceBeforeChoice.sVideoEnd.connect(onVideoEnd)
    }

    onVisibleChanged: {
        iBasicVideoSourceBeforeChoice.visible = true
    }

    function onVideoEnd(mediaPlayer) {
        //////////////////////////////
        console.log("Video end")
        //////////////////////////////
        iVideoBeforeChoice.visible = false
        if (pVideoWhileChoiceSource) {
            pVideoNext.visible = true
        } else if (pImageWhileChoiceSource) {
            pImageNext.visible = true
        } else {
            mBasicDisplay.error(iVideoBeforeChoice, "No image or video for choice.")
        }
        mCHgChoices.visible = true
    }
    function getmListItemToCheckIfLoaded() {
        if (pVideoBeforeChoiceSource) {
            return [iBasicVideoSourceBeforeChoice];
        }
        return []
    }

}
