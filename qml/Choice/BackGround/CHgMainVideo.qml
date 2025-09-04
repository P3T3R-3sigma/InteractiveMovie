import QtQuick
import Felgo
import QtMultimedia

import "../../basic_librairies/BasicVideoSource/v1"
import "../../basic_librairies/BasicText/v4"

Item {
    id: iMainVideoChoice

    property var pVideoNext: null
    property var pImageNext: null

    property bool pChoiceVisible: false
    property int pPosToShowChoices

    anchors.fill: parent

    BasicTextFitToText {
        id: iPlaceholderText
        text: mMainVideoSource

        visible: mDebugOverall && mMainVideoSource
        z: 100

        yPercent: 0.05
        textFontForceSizePixel: 40
        textColor: "black"
        borderColor: "Pink"
        borderWidthPercent: 0.01
    }

    BasicVideoSource {
        id: iMainVideo

        mSource: ""
        mVolume: mVideoVolume
    }

    AppButton {
        id: iPauseButton
        width: parent.width * 0.15
        height: parent.height * 0.1
        x: parent.width * 0.05
        y: parent.height * 0.65
        z: 20
        text: iMainVideo.getVideoState() === MediaPlayer.PlayingState ? "PAUSE" : "PLAY"
        visible: !pChoiceVisible
        onClicked: {
            if (iMainVideo.getVideoState() === MediaPlayer.PlayingState) {
                iMainVideo.pauseVideo()
            } else {
                iMainVideo.playVideo()
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        enabled: !pChoiceVisible && !mIsDebug
        onClicked: {
            skipVideo()
        }
    }

    Component.onCompleted: {
        iPlaceholder.sOnClicked.connect(skipVideo)
        if (mMainVideoSource && mIsTimer) {
            pPosToShowChoices = getPosFromSource()
        }
    }

    onVisibleChanged: {
        if (visible) {
            if (mMainVideoSource) {
                console.log(iMainVideo.mSource)
                iMainVideo.visible = true
                iMainVideo.startVideo()
                iTimer.start()
            }
        } else {
            iMainVideo.setVideoPosition(0)
            pChoiceVisible = false
            iMainVideo.visible = false
        }
    }

    Timer {
        id: iTimer
        interval: 400
        repeat: true
        onTriggered: {
            if (iMainVideo.getVideoPosition() > iMainVideo.getVideoDuration()-1000) {
                if (mIsTimer) {
                    iMainVideo.pauseVideo()
                    showChoices()
                    iGlobalMusic.startVideo()
                    pChoiceVisible = true
                } else {
                    startFadeOut(mDefaultChoice)
                }
                iTimer.stop()
            }
        }
    }

    function setSource() {
        iMainVideo.mSource = "qrc:/assets/Videos/" + mMainVideoSource + ".mp4"
    }
    function getSource() {
        return iMainVideo.mSource
    }

    function skipVideo() {
        setStatusChanges()
        if (mIsTimer) {
            if (mMainVideoSource) {
                iMainVideo.setVideoPosition(iMainVideo.getVideoDuration()-500)
            } else {
                showChoices()
                iGlobalMusic.startVideo()
                iTimer.stop()
            }

        } else {
            startFadeOut(mDefaultChoice)
        }
    }


    function getmListItemToCheckIfLoaded() {
        if (mMainVideoSource) {
            return [];
        }
        return []
    }

    function getPosFromSource() {
        return parseInt(mMainVideoSource.split("_")[1])
    }
}
