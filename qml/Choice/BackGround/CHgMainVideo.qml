import QtQuick
import Felgo
import QtMultimedia

import "../../basic_librairies/BasicVideoSource/v1"

Item {
    id: iMainVideoChoice

    property var pVideoNext: null
    property var pImageNext: null

    property int mTimerStart
    property bool pChoiceVisible: false

    anchors.fill: parent


    BasicVideoSource {
        id: iBasicVideoSourceMainVideo
        mSource: "qrc:/assets/Videos/" + mMainVideoSource + ".mp4"
        mVolume: mVideoVolume
    }

    MouseArea {
        anchors.fill: parent

        enabled: !pChoiceVisible && !mIsDebug
        onClicked: {
            if (mIsTimer) {
                iBasicVideoSourceMainVideo.setVideoPosition(mTimerStart)
            } else {
                onVideoEnd()
            }
        }
    }

    Component.onCompleted: {
        if (!mIsTimer) {
            iBasicVideoSourceMainVideo.sVideoEnd.connect(onVideoEnd)
        }

        iBasicVideoSourceMainVideo.sPositionChanged.connect(onPosChanged)
        iPlaceholder.sOnClicked.connect(skipVideoDebug)
    }

    onVisibleChanged: {
        if (visible) {
            if (mMainVideoSource) {
                iBasicVideoSourceMainVideo.visible = true
                iBasicVideoSourceMainVideo.startVideo()
            }

        } else {
            pChoiceVisible = false
        }
    }


    function onVideoEnd(mediaPlayer) {
        //////////////////////////////
        // console.log("Video end")
        //////////////////////////////

        iBasicVideoSourceMainVideo.stopVideo()
        iBasicVideoSourceMainVideo.setVideoPosition(0)
        iMainVideoChoice.visible = false
        pChoiceVisible = false
        switch (mDisplay) {
        case mDisplayEnum.ONE_VIDEO: {
            iChoiceManager.setStatusChanges()
            iChoiceManager.hideChoices()
            iChoiceManager.visible = false
            mDefaultChoice.visible = true
            break
            }
        case mDisplayEnum.TWO_VIDEO: {
            iChoiceManager.showChoices()
            pVideoNext.visible = true
            break
            }
        }
    }

    function skipVideoDebug() {
        if (mIsTimer) {
            pChoiceVisible = true
            iChoiceManager.showChoices()
        } else {
            onVideoEnd()
        }
    }

    function onPosChanged(position) {
        if (position >= iBasicVideoSourceMainVideo.getVideoDuration() - 100) {
            iBasicVideoSourceMainVideo.pauseVideo() // freeze on last frame
            pChoiceVisible = true
            iChoiceManager.showChoices()
        }
    }


    function getmListItemToCheckIfLoaded() {
        if (mMainVideoSource) {
            return [iBasicVideoSourceMainVideo];
        }
        return []
    }

}
