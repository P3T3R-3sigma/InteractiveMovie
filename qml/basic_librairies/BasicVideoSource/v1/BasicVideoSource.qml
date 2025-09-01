import QtQuick
import Felgo
import QtMultimedia

import "../../BasicLoader/v1"
import "../../Utils/v1"
import "../../BasicDebug/v1"


Item {
    id: mLoader

    anchors.fill: parent

    property int mVolume: 0
    property string mSource
    property bool shouldPause: false

    z: 10

    signal sVideoEnd(var mediaPlayer)
    signal sStopOnEnd(var mediaPlayer)
    signal sPositionChanged(var position)


    visible: false

    VideoOutput {
        id: mVideoOutput

        fillMode: VideoOutput.PreserveAspectFit
        anchors.fill: parent

        onFrameUpdated: {
            if (shouldPause) {
                shouldPause = false;
                mVideoMediaPlayer.pause();
            }
        }
    }

    MediaPlayer {
        id: mVideoMediaPlayer

        source: mSource
        videoOutput: mVideoOutput
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: mVolume
        }
        onPlaybackStateChanged: {
            ///////////////////////////////
            console.log("mediaStatus:", mediaStatus, "source:", source, "duration:", duration, "now:", Date.now())
            ///////////////////////////////
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                sVideoEnd(mVideoMediaPlayer)

                ///////////////////////////////
                console.log("End of media reached.")
                ///////////////////////////////
            } else if (mediaStatus === MediaPlayer.LoadedMedia) {
                ///////////////////////////////
                console.log("Loaded")
                ///////////////////////////////
            }
        }
        onPositionChanged: sPositionChanged(mVideoMediaPlayer.position)

    }


    onVisibleChanged: {
        if (visible) {
            mVideoMediaPlayer.play()
        } else {
            mVideoMediaPlayer.stop()
        }
    }

    function startVideo(){
        setVideoPosition(0)
        mVideoMediaPlayer.play()
    }
    function stopVideo(){
        mVideoMediaPlayer.stop()
    }
    function pauseVideo(){
        shouldPause = true
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


