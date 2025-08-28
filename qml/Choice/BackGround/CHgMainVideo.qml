import QtQuick
import Felgo
import QtMultimedia

import "../../basic_librairies/BasicLoader/v1"
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
        mSource: mMainVideoSource
        mVolume: mVideoVolume
    }

    MouseArea {
        anchors.fill: parent

        enabled: !pChoiceVisible && !mIsDebug
        onClicked: {
            if (mTime === 0) {
                onVideoEnd()
            } else {
                iBasicVideoSourceMainVideo.setVideoPosition(mTimerStart)
            }
        }
    }

    Component.onCompleted: {
        iBasicVideoSourceMainVideo.sVideoEnd.connect(onVideoEnd)
        iBasicVideoSourceMainVideo.sPositionChanged.connect(onPosChanged)
        iPlaceholder.sOnClicked.connect(skipVideoDebug)
    }

    onVisibleChanged: {
        if (visible) {
            if (mMainVideoSource) {
                iBasicVideoSourceMainVideo.visible = true
                if (iBasicVideoSourceMainVideo.getVideoDuration() > 0) {
                    mTimerStart = iBasicVideoSourceMainVideo.getVideoDuration() - mTime
                } else {
                    console.log("NOT LOADED, WRONG TIMING")
                }
            }

        } else {
            pChoiceVisible = false
        }
    }


    function onVideoEnd(mediaPlayer) {
        //////////////////////////////
        // console.log("Video end")
        //////////////////////////////
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
        if (mTime === 0) {
            onVideoEnd()
        } else {
            pChoiceVisible = true
            iChoiceManager.showChoices()
        }
    }

    function onPosChanged(position) {
        if (position > mTimerStart && !pChoiceVisible) {
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
