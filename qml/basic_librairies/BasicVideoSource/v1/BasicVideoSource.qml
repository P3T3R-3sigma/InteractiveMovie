import QtQuick
import Felgo
import QtMultimedia

import "../../BasicLoader/v1"
import "../../BasicDebug/v1"


BasicLoaderContainerGraphic {
    id: mLoader

    anchors.fill: parent

    property int mVolume: 0

    z: 10

    mItemWithSource: mVideoMediaPlayer

    signal sVideoEnd(var mediaPlayer)

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
            console.log("mediaStatus:", mediaStatus, "source:", source, "duration:", duration)
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

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            console.log("Should Play.", visible, mVideoMediaPlayer.position, mVideoMediaPlayer.mediaStatus, mVideoMediaPlayer.playbackState === MediaPlayer.PlayingState, z)
        }
    }



    onVisibleChanged: {
        if (visible) {
            console.log("Should Play.", visible, mVideoMediaPlayer.mediaStatus, mVideoMediaPlayer.playbackState === MediaPlayer.PlayingState)

            timer.start()
            mVideoMediaPlayer.play()
            console.log("Should Play.", visible, mVideoMediaPlayer.mediaStatus, mVideoMediaPlayer.playbackState === MediaPlayer.PlayingState)
        } else {
            timer.stop()
            mVideoMediaPlayer.stop()
        }
    }
    function startVideo(){
        timer.start()
        mVideoMediaPlayer.play()

    }
}


