import QtQuick
import Felgo

import "../../basic_librairies/BasicVideo/v1"
import "../../basic_librairies/BasicImageSource/v4"

Item {
    id: iSexItem

    property bool mIsDebug: false
    property var mNextVideo
    property var mListSourcesImagesToJumpTo
    property var mSourceSimple

    visible: false
    anchors.fill: parent

    BasicVideo {
        id: iBasicSexVideo

        visible: false
        z:1

        anchors.fill: parent
        mListSourcesImagesToJumpTo: iSexItem.mListSourcesImagesToJumpTo
        mSourceSimple: iSexItem.mSourceSimple

        onTerminated: {
            iSexItem.visible = false
            mNextVideo.visible = true
        }
    }

    BasicImageSource {
        id: iSecondaryImage

        visible: false

        anchors.fill: parent
        fillMode: Image.PreserveAspectFit

        sourceSimple: "Angel/Angel_003.jpg"

        MouseArea {
            anchors.fill: parent

            onClicked: {
                iSexItem.visible = false
                mNextVideo.visible = true
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            if (mIsDebug) {
                console.log("HERE")
                iSecondaryImage.visible = true
            } else {
                iBasicSexVideo.visible = true
            }
        }

    }

    function getmListItemToCheckIfLoaded() {
        return [iBasicSexVideo, iSecondaryImage]
    }

}


