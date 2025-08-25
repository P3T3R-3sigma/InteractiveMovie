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

        enabled: !pChoiceVisible
        onClicked: {
            iBasicVideoSourceMainVideo.setVideoPosition(mTimerStart)
        }
    }

    Component.onCompleted: {
        iBasicVideoSourceMainVideo.sVideoEnd.connect(onVideoEnd)
        iBasicVideoSourceMainVideo.sPositionChanged.connect(onPosChanged)
    }

    onVisibleChanged: {
        if (mMainVideoSource) {
            if (mDisplay === mDisplayEnum.DEBUG) {
                onVideoEnd()
            } else {
                iBasicVideoSourceMainVideo.visible = true
                if (iBasicVideoSourceMainVideo.getVideoDuration() > 0) {
                    mTimerStart = iBasicVideoSourceMainVideo.getVideoDuration() - mTime
                } else {
                    console.log("NOT LOADED, WRONG TIMING")
                }
            }
        }
    }


    function onVideoEnd(mediaPlayer) {
        //////////////////////////////
        // console.log("Video end")
        //////////////////////////////
        iMainVideoChoice.visible = false
        switch (mDisplay) {
        case mDisplayEnum.ONE_VIDEO: {
            mCHgChoices.visible = true
            iChoiceManager.visible = false
            mDefaultChoice.visible = true
            break
            }
        case mDisplayEnum.TWO_VIDEO: {
            mCHgChoices.visible = true
            pVideoNext.visible = true
            break
            }
        case mDisplayEnum.SEX_VIDEO: {
            mDefaultChoice.visible = true
            break
            }
        case mDisplayEnum.DEBUG: {
            mCHgChoices.visible = true
            pImageNext.visible = true
            break
            }
        }
    }
    function onPosChanged(position) {
        if (position > mTimerStart && !pChoiceVisible && mDisplay !== mDisplayEnum.SEX_VIDEO) {
            pChoiceVisible = true
            mCHgChoices.visible = true
        }
    }


    function getmListItemToCheckIfLoaded() {
        if (mMainVideoSource) {
            return [iBasicVideoSourceMainVideo];
        }
        return []
    }

}
