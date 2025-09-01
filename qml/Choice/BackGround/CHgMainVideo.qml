import QtQuick
import Felgo
import QtMultimedia

import "../../basic_librairies/BasicVideoSource/v1"

Item {
    id: iMainVideoChoice

    property var pVideoNext: null
    property var pImageNext: null

    property bool pChoiceVisible: false
    property int pPosToShowChoices

    anchors.fill: parent

    VideoOutput {
        id: mVideoOutput

        fillMode: VideoOutput.PreserveAspectFit
        anchors.fill: parent
    }

    MediaPlayer {
        id: mVideoMediaPlayer

        source: "qrc:/assets/Videos/" + mMainVideoSource + ".mp4"
        videoOutput: mVideoOutput
        audioOutput: AudioOutput {
            volume: mVideoVolume
        }
        onPlaybackStateChanged: {
            ///////////////////////////////
            // console.log("mediaStatus:", mediaStatus, "source:", source, "duration:", duration, "now:", Date.now())
            ///////////////////////////////
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                onVideoEnd(mVideoMediaPlayer)

                ///////////////////////////////
                // console.log("End of media reached.")
                ///////////////////////////////
            } else if (mediaStatus === MediaPlayer.LoadedMedia) {
                ///////////////////////////////
                // console.log("Loaded")
                ///////////////////////////////
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
                startVideo()
                iTimer.start()
            }
        } else {
            setVideoPosition(0)
            pChoiceVisible = false
        }
    }


    function onVideoEnd() {

        console.log("End Video", mMainVideoSource)
        stopVideo()
        setStatusChanges()
        iMainVideoChoice.visible = false
        pChoiceVisible = false
        iChoiceManager.visible = false
    }

    Timer {
        id: iTimer
        interval: 200
        repeat: true
        onTriggered: {
            if (getVideoPosition() > getVideoDuration()-450) {
                if (mIsTimer) {
                    pauseVideo()
                    iChoiceManager.showChoices()
                } else {
                    mDefaultChoice.visible = true
                    onVideoEnd()

                }

                console.log("Video choice end", mMainVideoSource)
                // mDefaultChoice.visible = true
                 iTimer.stop()
                // onVideoEnd()
            }
            // else if (getVideoPosition() > getVideoDuration()-4500) {
            //     console.log("Show choices", mMainVideoSource)
            //     showChoices()
            //     pChoiceVisible = true
            //     iTimer.stop()
            // }
        }
    }

    function skipVideo() {
        setStatusChanges()
        if (mIsTimer) {
            if (mMainVideoSource) {
                console.log("Skipping to choice position", mMainVideoSource)
                setVideoPosition(getVideoDuration()-500)
            } else {
                console.log("Show choices", mMainVideoSource)
                showChoices()
                iTimer.stop()
            }

        } else {
            console.log("Skipping to default", mMainVideoSource)
            mDefaultChoice.visible = true
            onVideoEnd()
        }
    }


    function getmListItemToCheckIfLoaded() {
        if (mMainVideoSource) {
            return [];
        }
        return []
    }

    function startVideo(){
        setVideoPosition(0)
        mVideoMediaPlayer.play()
    }
    function stopVideo(){
        mVideoMediaPlayer.stop()
    }
    function pauseVideo(){
        mVideoMediaPlayer.pause()
    }

    function getPosFromSource() {
        return parseInt(mMainVideoSource.split("_")[1])
    }

    function getVideoDuration() {
        return mVideoMediaPlayer.duration
    }

    function getVideoSource() {
        return mSource
    }
    function getVideoPosition() {
        return mVideoMediaPlayer.position
    }
    function setVideoPosition(sPosition) {
        mVideoMediaPlayer.position = sPosition
    }
}
