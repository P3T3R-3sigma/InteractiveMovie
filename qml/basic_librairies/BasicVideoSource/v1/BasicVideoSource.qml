import QtQuick
import Felgo
import QtMultimedia

import "../../BasicLoader/v1"
import "../../BasicDebug/v1"


BasicLoaderContainer {
    id: mLoader

    anchors.fill: parent

    property int mVolume: 0

    z: 10

    mItemWithSource: mVideoMediaPlayer

    signal sVideoEnd(var mediaPlayer)
    signal sPositionChanged(var position)

    visible: false

    VideoOutput {
        id: mVideoOutput

        fillMode: VideoOutput.PreserveAspectFit
        anchors.fill: parent
    }

    MediaPlayer {
        id: mVideoMediaPlayer

        videoOutput: mVideoOutput
        audioOutput: AudioOutput {
            volume: mVolume
        }
        onPlaybackStateChanged: {
            ///////////////////////////////
            // console.log("mediaStatus:", mediaStatus, "source:", source, "duration:", duration)
            ///////////////////////////////
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                sVideoEnd(mVideoMediaPlayer)
                ///////////////////////////////
                // console.log("End of media reached.")
                ///////////////////////////////
            } else if (mediaStatus === MediaPlayer.LoadedMedia) {
                ///////////////////////////////
                // console.log("Loaded")
                ///////////////////////////////
            }
        }
        onPositionChanged: sPositionChanged(mVideoMediaPlayer.position)
    }
    /**
      return a bool: true if ready, false if not ready
      */
    function checkForReady() {
        if (mVideoMediaPlayer.mediaStatus === MediaPlayer.NoMedia) {
            return false
        }
        /*
          Store the time it took to download
          */
        mIsReady = true
        return true
    }
    function getmListItemToCheckIfLoaded() {
        return []
    }



    onVisibleChanged: {
        if (visible) {
            mVideoMediaPlayer.play()
        } else {
            mVideoMediaPlayer.stop()
        }
    }
    function startVideo(){
        mVideoMediaPlayer.play()
    }
    function stopVideo(){
        mVideoMediaPlayer.stop()
    }
    function pauseVideo(){
        mVideoMediaPlayer.pause()
    }



    function getVideoDuration() {
        return mVideoMediaPlayer.duration
    }
    function getVideoPosition() {
        return mVideoMediaPlayer.position
    }
    function setVideoPosition(sPosition) {
        mVideoMediaPlayer.position = sPosition
    }
}


