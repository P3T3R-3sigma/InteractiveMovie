import QtQuick
import Felgo

import "../../basic_librairies/BasicVideo/v1"
import "../../basic_librairies/BasicImageSource/v4"

Item {
    id: iSexItem

    property bool mIsDebug: false
    property string mTitle: ""
    property var mNextVideo
    property var mListSourcesImagesToJumpTo
    property var mSourceSimple
    property bool mChoiceVisible: false


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
            terminate()
        }
    }

    CHgPlaceholder {
        id: iPlaceholder
    }

    onVisibleChanged: {
        if (visible) {
            if (mIsDebug) {
                iPlaceholder.visible = true
            } else {
                iBasicSexVideo.visible = true
            }
        }
    }

    Component.onCompleted: {
        iPlaceholder.sOnClicked.connect(terminate)
    }

    function terminate() {
        iSexItem.visible = false
        mNextVideo.visible = true
    }

    function getmListItemToCheckIfLoaded() {
        return [iBasicSexVideo]
    }

}


