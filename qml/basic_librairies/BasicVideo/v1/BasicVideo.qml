import QtQuick
import Felgo
import QtMultimedia
import "../../BasicLoader/v1"

Item {

    id: mThisBasicVideo

    /*
      Signal
      */
    signal terminated()
    /*
      Controls
      */
    property string mSourceSimple // does not contain 'assets'
    property var mListSourcesImagesToJumpTo: []
    property bool mIS_DEBUG
    property string mSubFolder: "Videos/"
    /*
      Variables
      */
    property real mVolume: 1    // from 0 to 1

    onVisibleChanged: {
        if (visible) {
            mThisBasicLoaderContainer.forceDownload()
            startVideo()
        }
    }
    /*
      Launch video should come before play/pause/stop. It will launch all the controls associated with the video
      */
    function startVideo() {
        mThisBasicVideo.visible = true
        mThisMediaPlayer.play();
        enableControls(true)
        mThisBasicVideoControls.hideControls()
    }

    /**
      Stop the media player and hide video controls
      */
    function stopVideo() {
        mThisMediaPlayer.stop();
        enableControls(false)
        mThisBasicVideoControls.hideControls()
        /*
          Call signal
          */
        terminated()
    }

    /*
      Loader
      */
    function getmListItemToCheckIfLoaded() {
        if (mIS_DEBUG
                && mListSourcesImagesToJumpTo.length !== mThisBasicVideoControls.getmListBasicVideoJump().length) {
            mBasicDisplay.error(mThisBasicVideo, "The list of source and BasicVideoJump are not synchronized"
                                + "\nmListSourcesImagesToJumpTo.length= " + mListSourcesImagesToJumpTo.length
                                + "\mThisBasicVideoControls.getmListBasicVideoJump().length= " + mThisBasicVideoControls.getmListBasicVideoJump().length);
        }
       return [mThisBasicVideoControls, mThisBasicLoaderContainer];
    }


    /*
      Loader container of the video
      */
    BasicLoaderContainer {
        id: mThisBasicLoaderContainer

        anchors.fill: parent

        /*
          Media container of the video
          */
        MediaPlayer {
            id: mThisMediaPlayer

            videoOutput: mThisVideoOutput
            audioOutput: AudioOutput {
                volume: mVolume
            }

            onPositionChanged: {
                mThisBasicVideoControls.updateTimeBar(mThisMediaPlayer.position / mThisMediaPlayer.duration)
            }

            onPlaybackStateChanged: {
                if (playbackState === MediaPlayer.StoppedState) {
                    mThisBasicVideo.stopVideo();
                }
            }
        }

        /*
          Actual video
          */
        VideoOutput {
            id: mThisVideoOutput

            anchors.fill: parent

            fillMode: VideoOutput.PreserveAspectFit
        }

        /**
          return a bool: true if ready, false if not ready
          */
        function checkForReady() {
            if (!mThisMediaPlayer) {
                return false;
            }
            if (mThisBasicVideoControls.getmListBasicVideoJump().length !== mThisBasicVideo.mListSourcesImagesToJumpTo.length) {
                return false;
            }
            /*
              The video is ready
              */
            mIsReady = true
            return true;

        }

        /**

          */
        function vStringErrorDownload() {
            mThisBasicVideo.getmStatusStr();
        }

    }

    /**

      */
    function getmStatusStr() {
        switch (mThisMediaPlayer.mediaStatus) {
        case MediaPlayer.NoMedia : return "No media has been set";
        case MediaPlayer.LoadingMedia : return "The media is currently being loaded";
        case MediaPlayer.LoadedMedia : return "The media has been loaded";
        case MediaPlayer.BufferingMedia : return "The media is buffering data";
        case MediaPlayer.StalledMedia : return "Playback has been interrupted while the media is buffering data.";
        case MediaPlayer.BufferedMedia : return "The media has buffered data";
        case MediaPlayer.EndOfMedia : return "The media has played to the end";
        case MediaPlayer.InvalidMedia : return "The media cannot be played";
        default: return "Unknown status"
        }
    }

    /*
      Set the source of the video
      */
    onMSourceSimpleChanged: {
        mThisMediaPlayer.source = mBasicSource.getSource(mSubFolder + mSourceSimple)
    }

    /**
      look for all images which have the
      */
    onMListSourcesImagesToJumpToChanged: {
        mThisBasicVideoControls.getmThisBasicVideoJumpManager()
                    .initiateBasicVideoJumps(mListSourcesImagesToJumpTo, mSubFolder)
    }

    /**
      Controls Area
      */
    BasicVideoControls {
        id: mThisBasicVideoControls

        x: parent.width * cBasicVideo.controls_X
        y: parent.height * cBasicVideo.controls_Y
        width: parent.width * cBasicVideo.controls_W
        height: parent.height * cBasicVideo.controls_H
        z: 1
    }

    /*
      Global mouseArea zone
      */
    MouseArea {
        id: mThisMouseAreaGlobal

        enabled: false
        anchors.fill: parent
        hoverEnabled: true
        onMouseXChanged: {
            mThisBasicVideoControls.showLight()
        }
        onMouseYChanged: {
            mThisBasicVideoControls.showLight()
        }
    }

    /*
      MouseArea to activate the controls
      */
    MouseArea {
        id: mThisMouseAreaControls

        enabled: false
        anchors.fill: mThisBasicVideoControls
        hoverEnabled: true
        onEntered: {
            mThisBasicVideoControls.showFull()
        }
    }

    /**
      We enable the controls when we start playing the video
      */
    function enableControls(sIsEnable) {
        mThisMouseAreaGlobal.enabled = sIsEnable
        mThisMouseAreaControls.enabled = sIsEnable;
    }

    function pause() {
        mThisMediaPlayer.pause()
    }

    function play() {
        mThisMediaPlayer.play()
    }

    /*
      Getters & Setters
      */
    function getmVolume() {
        return mVolume
    }
    function setmVolume(sVolume) {
        mVolume = sVolume
    }
    function getmPosition() {
        return mThisMediaPlayer.position;
    }
    function jumpTo(sTimeInMilliseconds) {
        mThisMediaPlayer.position = Math.max(0, Math.min(sTimeInMilliseconds, mThisMediaPlayer.duration)); // Jump to a moment in the video
    }
    function setmPositionPct(sPositionPct) {
        jumpTo(sPositionPct * mThisMediaPlayer.duration)
    }
    function getmDuration() {
        return mThisMediaPlayer.duration
    }


}
